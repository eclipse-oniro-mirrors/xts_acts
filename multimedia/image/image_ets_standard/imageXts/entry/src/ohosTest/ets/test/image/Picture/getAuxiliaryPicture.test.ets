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
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'getAuxiliaryPicture';

async function getAuxiliaryPicturePromiseTest(done: Function, testName: string, path: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType) {
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
      let auxPictureObj: image.AuxiliaryPicture | null =
        await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
      expect(auxPictureObj != null).assertTrue();
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

async function getAuxiliaryPictureAbnormalPromiseTest(done: Function, testName: string, path: string,
  AuxiliaryPictureType: ESObject) {
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
      let auxPictureObj: image.AuxiliaryPicture | null =
        await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
      expect(auxPictureObj != null).assertTrue();
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function PictureGetAuxiliaryPictureTest() {
  describe('PictureGetAuxiliaryPictureTest', () => {

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
     * @tc.number    : PICTURE_GET_AUXILIARY_PICTURE_001
     * @tc.name      : picture_getAuxiliaryPicture_promise_001
     * @tc.desc      : picture_getAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('picture_getAuxiliaryPicture_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getAuxiliaryPicture_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      await getAuxiliaryPicturePromiseTest(done, testName, path, AuxiliaryPictureType);
    })

    /**
     * @tc.number    : PICTURE_GET_AUXILIARY_PICTURE_002
     * @tc.name      : picture_getAuxiliaryPicture_promise_002
     * @tc.desc      : picture_getAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('picture_getAuxiliaryPicture_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getAuxiliaryPicture_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await getAuxiliaryPicturePromiseTest(done, testName, path, AuxiliaryPictureType);
    })

    /**
     * @tc.number    : PICTURE_GET_AUXILIARY_PICTURE_003
     * @tc.name      : picture_getAuxiliaryPicture_abnormal_promise_001
     * @tc.desc      : picture_getAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('picture_getAuxiliaryPicture_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getAuxiliaryPicture_abnormal_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = undefined;
      await getAuxiliaryPictureAbnormalPromiseTest(done, testName, path, AuxiliaryPictureType);
    })*/

    /**
     * @tc.number    : PICTURE_GET_AUXILIARY_PICTURE_004
     * @tc.name      : picture_getAuxiliaryPicture_abnormal_promise_002
     * @tc.desc      : picture_getAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('picture_getAuxiliaryPicture_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getAuxiliaryPicture_abnormal_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = null;
      await getAuxiliaryPictureAbnormalPromiseTest(done, testName, path, AuxiliaryPictureType);
    })*/
  })
}
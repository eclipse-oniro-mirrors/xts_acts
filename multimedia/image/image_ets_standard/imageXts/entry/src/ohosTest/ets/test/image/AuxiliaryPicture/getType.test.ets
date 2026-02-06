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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getType';

async function getTypePromiseTest(done: Function, testName: string, pathUri: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(pathUri);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);

    let commodityPixelMap: image.Picture | null = await imageSource.createPicture();

    let auxPictureObj: image.AuxiliaryPicture | null =
      await commodityPixelMap.getAuxiliaryPicture(AuxiliaryPictureType);

    if (auxPictureObj != null) {
      let type: image.AuxiliaryPictureType = auxPictureObj.getType();
      auxPictureObj.release();
      done();
    } else {
      console.error('AuxPictureObj is null.');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function AuxiliaryGetTypeTest() {
  describe('AuxiliaryGetTypeTest', () => {

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
     * @tc.name   auxiliaryPicture_getType_promise_001
     * @tc.number AUXILIARY_PICTURE_GET_TYPE_001
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('auxiliaryPicture_getType_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      await getTypePromiseTest(done, testName, path, AuxiliaryPictureType);
    })*/

    /**
     * @tc.name   auxiliaryPicture_getType_promise_002
     * @tc.number AUXILIARY_PICTURE_GET_TYPE_002
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('auxiliaryPicture_getType_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      await getTypePromiseTest(done, testName, path, AuxiliaryPictureType);
    })*/

    /**
     * @tc.name   auxiliaryPicture_getType_promise_003
     * @tc.number AUXILIARY_PICTURE_GET_TYPE_003
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_getType_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_003';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      await getTypePromiseTest(done, testName, path, AuxiliaryPictureType);
    })

    /**
     * @tc.name   auxiliaryPicture_getType_promise_004
     * @tc.number AUXILIARY_PICTURE_GET_TYPE_004
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('auxiliaryPicture_getType_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_004';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      await getTypePromiseTest(done, testName, path, AuxiliaryPictureType);
    })*/

    /**
     * @tc.name   auxiliaryPicture_getType_promise_005
     * @tc.number AUXILIARY_PICTURE_GET_TYPE_005
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_getType_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_getType_promise_005';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await getTypePromiseTest(done, testName, path, AuxiliaryPictureType);
    });
  })
}
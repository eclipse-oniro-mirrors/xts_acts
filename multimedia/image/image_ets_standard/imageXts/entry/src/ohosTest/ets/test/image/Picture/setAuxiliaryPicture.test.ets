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

const TAG = LOG_TAG + 'setAuxiliaryPicture';

async function setAuxiliaryPicturePromiseTest(done: Function, testName: string, pathUri: string,
  AuxiliaryPictureType: image.AuxiliaryPictureType) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(pathUri);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let PictureObj: image.Picture | null = await imageSource.createPicture();

    if (PictureObj != null) {
      let auxPictureObj: image.AuxiliaryPicture | null = await PictureObj.getAuxiliaryPicture(AuxiliaryPictureType);
      if (auxPictureObj != null) {
        await PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureObj);
        PictureObj.release();
        done();
      }
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function setAuxiliaryPictureAbnormalPromiseTest(done: Function, testName: string, pathUri: string,
  AuxiliaryPictureType: ESObject, auxPictureObj: ESObject) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(pathUri);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let PictureObj: image.Picture | null = await imageSource.createPicture();

    if (PictureObj != null) {
      await PictureObj.setAuxiliaryPicture(AuxiliaryPictureType, auxPictureObj);
      PictureObj.release();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function PictureSetAuxiliaryPictureTest() {
  describe('PictureSetAuxiliaryPictureTest', () => {

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
     * @tc.name   picture_setAuxiliaryPicture_promise_001
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_001
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_setAuxiliaryPicture_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setAuxiliaryPicture_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      await setAuxiliaryPicturePromiseTest(done, testName, path, AuxiliaryPictureType);
    })

    /**
     * @tc.name   picture_setAuxiliaryPicture_promise_002
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_002
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_setAuxiliaryPicture_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setAuxiliaryPicture_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await setAuxiliaryPicturePromiseTest(done, testName, path, AuxiliaryPictureType);
    })

    /**
     * @tc.name   picture_setAuxiliaryPicture_abnormal_promise_001
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_003
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_setAuxiliaryPicture_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setAuxiliaryPicture_abnormal_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      const auxPictureObj = null;
      await setAuxiliaryPictureAbnormalPromiseTest(done, testName, path, AuxiliaryPictureType, auxPictureObj);
    })

    /**
     * @tc.name   picture_setAuxiliaryPicture_abnormal_promise_002
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_004
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_setAuxiliaryPicture_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setAuxiliaryPicture_abnormal_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = null;
      const auxPictureObj = null;
      await setAuxiliaryPictureAbnormalPromiseTest(done, testName, path, AuxiliaryPictureType, auxPictureObj);
    })

    /**
     * @tc.name   picture_setAuxiliaryPicture_abnormal_promise_003
     * @tc.number PICTURE_SET_AUXILIARY_PICTURE_005
     * @tc.desc   setAuxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_setAuxiliaryPicture_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setAuxiliaryPicture_abnormal_promise_003';
      const path = 'AllAuxiliaryPictures.jpg';
      let AuxiliaryPictureType = undefined;
      const auxPictureObj = undefined;
      await setAuxiliaryPictureAbnormalPromiseTest(done, testName, path, AuxiliaryPictureType, auxPictureObj);
    })
  })
}
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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createAuxiliaryPicture';

async function createAuxiliaryPicturePromiseTest(done: Function, testName: string, path: string, auxSize: Size,
  auxType: image.AuxiliaryPictureType) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let funcName = "CreateAuxiliaryPicture";
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
    let auxPictureObj: image.AuxiliaryPicture | null = await image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
    if (auxPictureObj != null) {
      let type: image.AuxiliaryPictureType = auxPictureObj.getType();
      console.info(funcName, 'CreateAuxiliaryPicture succeeded this.Aux_picture.type.' + JSON.stringify(type));
      done();
    } else {
      console.error(funcName, 'CreateAuxiliaryPicture failed');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(`failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createAuxiliaryPictureAbnormalPromiseTest(done: Function, testName: string, path: string, auxSize?: Size,
  auxType?: image.AuxiliaryPictureType) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let funcName = "CreateAuxiliaryPicture";
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
    let auxPictureObj: image.AuxiliaryPicture | null = await image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
    if (auxPictureObj != null) {
      let type: image.AuxiliaryPictureType = auxPictureObj.getType();
      console.info(funcName, 'CreateAuxiliaryPicture succeeded this.Aux_picture.type.' + JSON.stringify(type));
      done();
    } else {
      console.error(funcName, 'CreateAuxiliaryPicture failed');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function createAuxiliaryPictureTest() {
  describe('createAuxiliaryPictureTest', () => {

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
     * @tc.number    : IMAGE_CREATE_AUXILIARY_PICTURE_001
     * @tc.name      : createAuxiliaryPicture_promise_001
     * @tc.desc      : createAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAuxiliaryPicture_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAuxiliaryPicture_promise_001';
      const path = 'test.jpg';
      let auxSize: Size = {
        height: 180,
        width: 240
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      await createAuxiliaryPicturePromiseTest(done, testName, path, auxSize, auxType);
    })

    /**
     * @tc.number    : IMAGE_CREATE_AUXILIARY_PICTURE_002
     * @tc.name      : createAuxiliaryPicture_promise_002
     * @tc.desc      : createAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAuxiliaryPicture_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAuxiliaryPicture_promise_002';
      const path = 'test.svg'
      let auxSize: Size = {
        height: 10,
        width: 20
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      await createAuxiliaryPicturePromiseTest(done, testName, path, auxSize, auxType);
    })

    /**
     * @tc.number    : IMAGE_CREATE_AUXILIARY_PICTURE_003
     * @tc.name      : createAuxiliaryPicture_promise_003
     * @tc.desc      : createAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAuxiliaryPicture_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAuxiliaryPicture_promise_003';
      const path = 'test_aisr.dng';
      let auxSize: Size = {
        height: 600,
        width: 600
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      await createAuxiliaryPicturePromiseTest(done, testName, path, auxSize, auxType);
    })

    /**
     * @tc.number    : IMAGE_CREATE_AUXILIARY_PICTURE_004
     * @tc.name      : createAuxiliaryPicture_promise_004
     * @tc.desc      : createAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAuxiliaryPicture_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAuxiliaryPicture_promise_004';
      const path = 'test_aisr.dng';
      let auxSize: Size = {
        height: 600,
        width: 600
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      await createAuxiliaryPicturePromiseTest(done, testName, path, auxSize, auxType);
    })

    /**
     * @tc.number    : IMAGE_CREATE_AUXILIARY_PICTURE_005
     * @tc.name      : createAuxiliaryPicture_promise_005
     * @tc.desc      : createAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAuxiliaryPicture_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAuxiliaryPicture_promise_005';
      const path = 'test_aisr.dng';
      let auxSize: Size = {
        height: 300,
        width: 300
      };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPicturePromiseTest(done, testName, path, auxSize, auxType);
    })

    /**
     * @tc.number    : IMAGE_CREATE_AUXILIARY_PICTURE_006
     * @tc.name      : createAuxiliaryPicture_abnormal_promise_001
     * @tc.desc      : createAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAuxiliaryPicture_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAuxiliaryPicture_abnormal_promise_001';
      const path = 'test_aisr.dng';
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await createAuxiliaryPictureAbnormalPromiseTest(done, testName, path, undefined, auxType);
    })

    /**
     * @tc.number    : IMAGE_CREATE_AUXILIARY_PICTURE_007 //TODO auxType传undefined会报错误undefined 而不是错误码401
     * @tc.name      : createAuxiliaryPicture_abnormal_promise_002
     * @tc.desc      : createAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createAuxiliaryPicture_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAuxiliaryPicture_abnormal_promise_002';
      const path = 'test_aisr.dng';
      let auxSize: Size = {
        height: 300,
        width: 300
      };
      let auxType = undefined;
      await createAuxiliaryPictureAbnormalPromiseTest(done, testName, path, auxSize, auxType);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_AUXILIARY_PICTURE_008
     * @tc.name      : createAuxiliaryPicture_abnormal_promise_003
     * @tc.desc      : createAuxiliaryPicture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createAuxiliaryPicture_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAuxiliaryPicture_abnormal_promise_003';
      const path = 'test_aisr.dng';
      await createAuxiliaryPictureAbnormalPromiseTest(done, testName, path, undefined, undefined);
    })
  })
}
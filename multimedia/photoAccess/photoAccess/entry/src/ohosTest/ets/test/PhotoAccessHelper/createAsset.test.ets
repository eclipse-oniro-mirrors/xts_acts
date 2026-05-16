/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { driveFn, getPermission, photoType, sleep } from '../common'
import common from '@ohos.app.ability.common'

export default function createAssetTest () {
  describe('createAssetTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    const createAssetCallback1 = async (done: Function, testNum: string, type: photoAccessHelper.PhotoType,
      extension: string, options: photoAccessHelper.CreateOptions) => {
      try {
        helper.createAsset(type, extension, options, (err, uri) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} uri: ${uri}`);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetCallback2 = async (done: Function, testNum: string, type: photoAccessHelper.PhotoType,
      extension: string) => {
      try {
        helper.createAsset(type, extension, (err, uri) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} uri: ${uri}`);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetAbnormalCallback1 = async (done: Function, testNum: string,
      type: photoAccessHelper.PhotoType | undefined, extension: string | undefined,
      options: photoAccessHelper.CreateOptions | undefined) => {

      try {
        helper.createAsset(type, extension, options, (err, uri) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
            } else {
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

    const createAssetPromise1 = async (done: Function, testNum: string, type: photoAccessHelper.PhotoType,
      extension: string, options: photoAccessHelper.CreateOptions) => {
      try {
        await helper.createAsset(type, extension, options);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetPromise2 = async (done: Function, testNum: string, type: photoAccessHelper.PhotoType,
      extension: string) => {
      try {
        await helper.createAsset(type, extension);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetAbnormalPromise1 = async (done: Function, testNum: string,
      type: photoAccessHelper.PhotoType | undefined, extension: string | undefined,
      options: photoAccessHelper.CreateOptions | undefined) => {
      try {
        await helper.createAsset(type, extension, options);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

    const createAssetAbnormalPromise2 = async (done: Function, testNum: string,
      type: photoAccessHelper.PhotoType | undefined, extension: string | undefined) => {
      try {
        await helper.createAsset(type, extension);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    }
    /**
     * @tc.name   createImage_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0000
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createImage_callback_000';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0100
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createImage_callback_001';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      await createAssetCallback2(done, testNum, type, extension);
    });
    /**
     * @tc.name   createImage_callback_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0200
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_callback_002';
      const type = undefined;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_callback_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0300
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_callback_003';
      const type = photoType.IMAGE;
      const extension = '123';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_callback_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0400
     * @tc.desc   createAsset with undefined extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_callback_004';
      const type = photoType.IMAGE;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_callback_005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0500
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_callback_005';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_callback_006
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_IMAGE_0600
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_callback_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_callback_006';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions | undefined= undefined;
      await createAssetAbnormalCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0000
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createImage_promise_000';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_promise_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0100
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createImage_promise_001';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      await createAssetPromise2(done, testNum, type, extension);
    });
    /**
     * @tc.name   createImage_promise_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0200
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_promise_002';
      const type = undefined;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_promise_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0300
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_promise_003';
      const type = photoType.IMAGE;
      const extension = '123';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_promise_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0400
     * @tc.desc   createAsset with undefined extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_promise_004';
      const type = photoType.IMAGE;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_promise_005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0500
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_promise_005';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createImage_promise_006
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0600
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_promise_006';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0000
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createVideo_callback_000';
      const type = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0100
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createVideo_callback_001';
      const type = photoType.VIDEO;
      const extension = 'mp4';
      await createAssetCallback2(done, testNum, type, extension);
    });
    /**
     * @tc.name   createVideo_callback_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0200
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_callback_002';
      const type = undefined;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_callback_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0300
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_callback_003';
      const type = photoType.VIDEO;
      const extension = '123';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_callback_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0400
     * @tc.desc   createAsset with undefined extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_callback_004';
      const type = photoType.VIDEO;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_callback_005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0500
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_callback_005';
      const type = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_callback_006
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_VIDEO_0600
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_callback_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_callback_006';
      const type = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalCallback1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_0000
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createVideo_promise_000';
      const type = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_promise_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_0100
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createVideo_promise_001';
      const type = photoType.VIDEO;
      const extension = 'mp4';
      await createAssetPromise2(done, testNum, type, extension);
    });
    /**
     * @tc.name   createVideo_promise_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_0200
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_promise_002';
      const type = undefined;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_promise_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_0300
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_promise_003';
      const type = photoType.VIDEO;
      const extension = '123';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_promise_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_0400
     * @tc.desc   createAsset with undefined extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_promise_004';
      const type = photoType.VIDEO;
      const extension = undefined;
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_promise_005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_0500
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_promise_005';
      const type = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   createVideo_promise_006
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_VIDEO_0600
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_promise_006';
      const type = photoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0001
     * @tc.name       createAssets_0001
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0001';
      const type = photoType.IMAGE;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0002
     * @tc.name       createAssets_0002
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0002';
      const type = photoType.VIDEO;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0003
     * @tc.name       createAssets_0003
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0003';
      const type = photoType.VIDEO;
      const extension = 'jpg.jpg';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0004
     * @tc.name       createAssets_0004
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0004';
      const type = photoType.IMAGE;
      const extension = 'fpx';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0005
     * @tc.name       createAssets_0005
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0005';
      const type = photoType.VIDEO;
      const extension = 'mp3';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0006
     * @tc.name       createAssets_0006
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0006';
      const type = photoType.VIDEO;
      const extension = '';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0007
     * @tc.name       createAssets_0007
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0007';
      const type = photoType.VIDEO;
      const extension = 'ykv';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0008
     * @tc.name       createAssets_0008
     * @tc.desc       createAsset CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0008';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT
      }
      await createAssetPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0009
     * @tc.name       createAssets_0009
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0009';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: 'createAssets_0009.jpg'
      }
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0010
     * @tc.name       createAssets_0010
     * @tc.desc       createAsset with undefined CreateOptions
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0010';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: ''
      }
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0011
     * @tc.name       createAssets_0011
     * @tc.desc       createAsset with CreateOptions whitespace
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0011';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: '       '
      }
      await createAssetPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0012
     * @tc.name       createAssets_0012
     * @tc.desc       createAsset with Invalid characters of title
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0012', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0012';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      let options: photoAccessHelper.CreateOptions;
      let value = [".", "..", "\\", "/", ":", "*", "?", "\"", "\'", "`", "<", ">", "|", "{", "}", "[", "]"];
      for (let i = 0; i < value.length; i++) {
        options = { title: value[i] }
        await createAssetAbnormalPromise1(done, testNum, type, extension, options);
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0013
     * @tc.name       createAssets_0013
     * @tc.desc       createAsset too long title 255
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0013', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0013';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      let value = '';
      for (let i = 0; i < 252; i++) {
        value += 'l';
      }
      const options: photoAccessHelper.CreateOptions = {
        title: value
      }
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0014
     * @tc.name       createAssets_0014
     * @tc.desc       createAsset long title 255
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0014', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0014';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      let value = '';
      for (let i = 0; i < 251; i++) {
        value += 'l';
      }
      const options: photoAccessHelper.CreateOptions = {
        title: value
      }
      await createAssetPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_Assets_0017
     * @tc.name       createAssets_0017
     * @tc.desc       createAsset with createOptions: null object
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createAssets_0017', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createAssets_0017';
      const type = photoType.IMAGE;
      const extension = 'jpg';
      let options: photoAccessHelper.CreateOptions = {
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0180
     * @tc.name       createAssets_0018
     * @tc.desc       createAsset with Abnormal Parameters
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createAssets_0018', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createAssets_0018';
      const type = photoType.IMAGE;
      const extension = 'mp4';
      await createAssetAbnormalPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0190
     * @tc.name       createAssets_0019
     * @tc.desc       createAsset with Abnormal Parameters
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createAssets_0019', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createAssets_0019';
      const type = photoType.VIDEO;
      const extension = 'jpg';
      await createAssetAbnormalPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0200
     * @tc.name       createAssets_0020
     * @tc.desc       createAsset with Abnormal Parameters
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createAssets_0020', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createAssets_0020';
      const type = photoType.VIDEO;
      const extension = 'jpg.jpg';
      await createAssetAbnormalPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0210
     * @tc.name       createAssets_0021
     * @tc.desc       createAsset with Abnormal Parameters
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createAssets_0021', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createAssets_0021';
      const type = photoType.IMAGE;
      const extension = 'fpx';
      await createAssetAbnormalPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0220
     * @tc.name       createAssets_0022
     * @tc.desc       createAsset with Abnormal Parameters
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createAssets_0022', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createAssets_0022';
      const type = photoType.IMAGE;
      const extension = 'fpx';
      await createAssetAbnormalPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0230
     * @tc.name       createAssets_0023
     * @tc.desc       createAsset with Abnormal Parameters
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createAssets_0023', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createAssets_0023';
      const type = photoType.VIDEO;
      const extension = 'mp3';
      await createAssetAbnormalPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0240
     * @tc.name       createAssets_0024
     * @tc.desc       createAsset with Abnormal Parameters
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createAssets_0024', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createAssets_0024';
      const type = photoType.VIDEO;
      const extension = '';
      await createAssetAbnormalPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_IMAGE_0250
     * @tc.name       createAssets_0025
     * @tc.desc       createAsset with Abnormal Parameters
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createAssets_0025', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createAssets_0025';
      const type = photoType.VIDEO;
      const extension = 'ykv';
      await createAssetAbnormalPromise2(done, testNum, type, extension);
    });
  })
}

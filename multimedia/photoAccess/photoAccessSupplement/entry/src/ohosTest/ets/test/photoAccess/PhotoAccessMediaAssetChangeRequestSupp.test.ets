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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import {
  sleep,
  getPermission,
  driveFn, isEmpty
} from '../common';
import common from '@ohos.app.ability.common';
import { Context, ErrorCode } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';

const TAG = 'photoAccessXtsSupp.ChangeRequestSuppTest'
type phContext = common.UIAbilityContext

export default function PhotoAccessMediaAssetChangeRequestSuppTest() {
  describe('PhotoAccessMediaAssetChangeRequestSuppTest', ()=>{
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let assetCount = 0;
    beforeAll(async ()=>{
      console.info('beforeAll case');
      AppStorage.setOrCreate('contextName','contextValue')
      AppStorage.setOrCreate('testText','testText')
      AppStorage.setOrCreate('file',-100)
      await getPermission();
      await driveFn();
      await sleep(1000)
    });
    beforeEach(async ()=>{
      await sleep(300);
      console.info('beforeEach case');
    });
    afterEach(async ()=>{
      console.info('afterEach case');
      await sleep(1000)
    });
    afterAll(()=>{
      console.info('afterAll case');
      AppStorage.delete('contextName')
      AppStorage.delete('file')
      AppStorage.delete('testText')
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_001
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_001
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_001', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(undefined, undefined);
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_002
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_002
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_13900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_002', Level.LEVEL0, async (done:Function)=> {
      try {
        let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(undefined, fileUri);
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 13900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_003
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_003
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_003', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, undefined);
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_004
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_004
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_004', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(null, null);
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_005
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_005
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_13900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_005', Level.LEVEL0, async (done:Function)=> {
      try {
        let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(null, fileUri);
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 13900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_006
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_006
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_006', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, null);
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_007
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_007
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_13900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_007', Level.LEVEL0, async (done:Function)=> {
      try {
        let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, fileUri);
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 13900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_008
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_008
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_13900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_008', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, '');
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 13900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_009
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_009
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_009', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(AppStorage.get('contextName'), AppStorage.get('file'));
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createImageAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_001
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_001
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_001', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(undefined, undefined);
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_002
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_002
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_13900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_002', Level.LEVEL0, async (done:Function)=> {
      try {
        let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(undefined, fileUri);
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 13900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_003
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_003
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_003', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, undefined);
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_004
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_004
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_004', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(null, null);
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_005
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_005
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_13900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_005', Level.LEVEL0, async (done:Function)=> {
      try {
        let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(null, fileUri);
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 13900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_006
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_006
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_006', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, null);
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_007
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_007
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_13900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_007', Level.LEVEL0, async (done:Function)=> {
      try {
        let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, fileUri);
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 13900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_008
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_008
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_13900002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_008', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, '');
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 13900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_009
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_009
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_CreateImageAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_CreateVideoAssetRequest_009', Level.LEVEL0, async (done:Function)=> {
      try {
        photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(AppStorage.get('contextName'), AppStorage.get('file'));
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `createVideoAssetRequest failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_001
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_001
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_001', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_001 start');
      try {
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, 0, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_002
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_002
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_002', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_002 start');
      try {
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, -1, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_003
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_003
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_003', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_003 start');
      try {
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, 3, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_004
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_004
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_004', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_004 start');
      try {
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, undefined, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_005
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_005
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_005', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_005 start');
      try {
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, null, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_006
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_006
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_006', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_006 start');
      try {
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, AppStorage.get('testText'), extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_007
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_007
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_007', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_007 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, null, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_008
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_008
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_008', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_008 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, undefined, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_009
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_009
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_009', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_009 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = '';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_010
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_010
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_010', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_010 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'abc';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_011
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_011
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_011', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_011 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'abc.jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_012
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_012
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_012', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_012 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_0121
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_0121
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_0121', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_012 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: AppStorage.get('file')
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_013
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_013
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_013', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_013 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: ''
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_014
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_014
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_014', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_014 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'abc.jpg'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_015
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_015
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_015', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_015 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_016
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_016
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_016', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_016 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: '//photo'
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_017
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_017
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_017', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_017 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: AppStorage.get('file')
        }
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_018
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_018
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_018', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_018 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_018' + testContext + photoType + extension);
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_019
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_019
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_019', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_019 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_019' + testContext + photoType + extension);
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_020
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_020
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_020', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_020 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testVideo',
          subtype: -1
        }
        console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_020' + testContext + photoType + extension);
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_021
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_021
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_021', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_021 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testVideo',
          subtype: 5
        }
        console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_020' + testContext + photoType + extension);
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_022
     * @tc.number SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_022
     * @tc.desc   PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_error_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_022', Level.LEVEL0, async (done:Function)=> {
      console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_022 start');
      try {
        let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testVideo',
          subtype: -1000
        }
        console.info(TAG,'SUB_MEDIA_PHOTOACCESS_MediaAssetChangeRequest_createAssetRequest_020' + testContext + photoType + extension);
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect().assertFail();
      } catch (err) {
        console.error(TAG,`createAssetRequestDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

  });
}


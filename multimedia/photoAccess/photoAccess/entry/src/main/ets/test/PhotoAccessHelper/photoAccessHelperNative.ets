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

import { describe, it, expect, beforeAll} from '@ohos/hypium'
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import mediaLibrary from "libphotoAccessHelperTest.so";
import {
  photoKeys,
  getPermission,
  photoFetchOption,
  getFileAsset,
  getAssetId,
  isNum,
  photoType,
} from '../../../../../../../common'

const TAG = "MEDIA_LIBRARY_LOGTAG_NATIVE";
const MEDIA_LIBRARY_OK = 0;
const MEDIA_LIBRARY_PARAMETER_ERROR = 401;

export default function PhotoAccessHelperNativeTest() {

  describe('PhotoAccessHelperNativeTest', () => {
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission();
    })

    /**
     * @tc.number     : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_URI_NATIVE_0100
     * @tc.name       : TestMediaAssetGetUri0100
     * @tc.desc       : Get the uri of the media asset when mediaAsset is invalid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('TestMediaAssetGetUri0100', 2, async function (done) {
      let testNum = 'TestMediaAssetGetUri0100';
      try {
        let ret = mediaLibrary.testMediaAssetGetUri(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_URI_NATIVE_0200
     * @tc.name       : TestMediaAssetGetUri0200
     * @tc.desc       : Get the uri of the media asset when uri is invalid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('TestMediaAssetGetUri0200', 2, async function (done) {
      let testNum = 'TestMediaAssetGetUri0200';
      try {
        let ret = mediaLibrary.testMediaAssetGetUri(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DISPLAY_NAME_NATIVE_0100
     * @tc.name      : TestMediaAssetGetDisplayName0100
     * @tc.desc      : Get the displayName of the media asset when mediaAsset is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetDisplayName0100', 2, async function (done) {
      let testNum = 'TestMediaAssetGetDisplayName0100';
      try {
        let ret = mediaLibrary.testMediaAssetGetDisplayName(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DISPLAY_NAME_NATIVE_0200
     * @tc.name      : TestMediaAssetGetDisplayName0200
     * @tc.desc      : Get the displayName of the media asset when displayName is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetDisplayName0200', 2, async function (done) {
      let testNum = 'TestMediaAssetGetDisplayName0200';
      try {
        let ret = mediaLibrary.testMediaAssetGetDisplayName(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_SIZE_NATIVE_0100
     * @tc.name      : TestMediaAssetGetSize0100
     * @tc.desc      : Get the size of the media asset when mediaAsset is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetSize0100', 2, async function (done) {
      let testNum = 'TestMediaAssetGetSize0100';
      try {
        let ret = mediaLibrary.testMediaAssetGetSize(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_SIZE_NATIVE_0200
     * @tc.name      : TestMediaAssetGetSize0200
     * @tc.desc      : Get the size of the media asset when size is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetSize0200', 2, async function (done) {
      let testNum = 'TestMediaAssetGetSize0200';
      try {
        let ret = mediaLibrary.testMediaAssetGetSize(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_MODIFIED_MS_NATIVE_0100
     * @tc.name      : TestMediaAssetGetDateModifiedMs0100
     * @tc.desc      : Get the dateModifiedMs of the media asset when mediaAsset is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetDateModifiedMs0100', 2, async function (done) {
      let testNum = 'TestMediaAssetGetDateModifiedMs0100';
      try {
        let ret = mediaLibrary.testMediaAssetGetDateModifiedMs(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_MODIFIED_MS_NATIVE_0200
     * @tc.name      : TestMediaAssetGetDateModifiedMs0200
     * @tc.desc      : Get the dateModifiedMs of the media asset when dateModifiedMs is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetDateModifiedMs0200', 2, async function (done) {
      let testNum = 'TestMediaAssetGetDateModifiedMs0200';
      try {
        let ret = mediaLibrary.testMediaAssetGetDateModifiedMs(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_WIDTH_NATIVE_0100
     * @tc.name      : TestMediaAssetGetWidth0100
     * @tc.desc      : Get the width of the media asset when mediaAsset is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetWidth0100', 2, async function (done) {
      let testNum = 'TestMediaAssetGetWidth0100';
      try {
        let ret = mediaLibrary.testMediaAssetGetWidth(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_WIDTH_NATIVE_0200
     * @tc.name      : TestMediaAssetGetWidth0200
     * @tc.desc      : Get the width of the media asset when width is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetWidth0200', 2, async function (done) {
      let testNum = 'TestMediaAssetGetWidth0200';
      try {
        let ret = mediaLibrary.testMediaAssetGetWidth(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_HEIGHT_NATIVE_0100
     * @tc.name      : TestMediaAssetGetHeight0100
     * @tc.desc      : Get the height of the media asset when mediaAsset is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetHeight0100', 2, async function (done) {
      let testNum = 'TestMediaAssetGetHeight0100';
      try {
        let ret = mediaLibrary.testMediaAssetGetHeight(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_HEIGHT_NATIVE_0200
     * @tc.name      : TestMediaAssetGetHeight0200
     * @tc.desc      : Get the height of the media asset when height is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetHeight0200', 2, async function (done) {
      let testNum = 'TestMediaAssetGetHeight0200';
      try {
        let ret = mediaLibrary.testMediaAssetGetHeight(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_ORIENTATION_NATIVE_0100
     * @tc.name      : TestMediaAssetGetOrientation0100
     * @tc.desc      : Get the orientation of the media asset when mediaAsset is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetOrientation0100', 2, async function (done) {
      let testNum = 'TestMediaAssetGetOrientation0100';
      try {
        let ret = mediaLibrary.testMediaAssetGetOrientation(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_ORIENTATION_NATIVE_0200
     * @tc.name      : TestMediaAssetGetOrientation0200
     * @tc.desc      : Get the orientation of the media asset when orientation is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetGetOrientation0200', 2, async function (done) {
      let testNum = 'TestMediaAssetGetOrientation0200';
      try {
        let ret = mediaLibrary.testMediaAssetGetOrientation(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_RELEASE_NATIVE_0100
     * @tc.name      : TestMediaAssetRelease0100
     * @tc.desc      : Release media asset object when mediaAsset is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAssetRelease0100', 2, async function (done) {
      let testNum = 'TestMediaAssetRelease0100';
      try {
        let ret = mediaLibrary.testMediaAssetRelease(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0100
     * @tc.name      : TestChangeRequestAddResourceWithBuffer0100
     * @tc.desc      : Add resource by arrayBuffer when changeRequest is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestAddResourceWithBuffer0100', 2, async function (done) {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0100';
      try {
        let ret = mediaLibrary.testChangeRequestAddResourceWithBuffer(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0200
     * @tc.name      : TestChangeRequestAddResourceWithBuffer0200
     * @tc.desc      : Add resource by arrayBuffer when resourceType is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestAddResourceWithBuffer0200', 2, async function (done) {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0200';
      try {
        let ret = mediaLibrary.testChangeRequestAddResourceWithBuffer(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0300
     * @tc.name      : TestChangeRequestAddResourceWithBuffer0300
     * @tc.desc      : Add resource by arrayBuffer when buffer is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestAddResourceWithBuffer0300', 2, async function (done) {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0300';
      try {
        let ret = mediaLibrary.testChangeRequestAddResourceWithBuffer(3);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0400
     * @tc.name      : TestChangeRequestAddResourceWithBuffer0400
     * @tc.desc      : Add resource by arrayBuffer when length is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestAddResourceWithBuffer0400', 2, async function (done) {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0400';
      try {
        let ret = mediaLibrary.testChangeRequestAddResourceWithBuffer(4);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0500
     * @tc.name      : TestChangeRequestAddResourceWithBuffer0500
     * @tc.desc      : Add resource by arrayBuffer when resourceType is image resource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestAddResourceWithBuffer0500', 2, async function (done) {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0500';
      try {
        let ret = mediaLibrary.testChangeRequestAddResourceWithBuffer(6);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0600
     * @tc.name      : TestChangeRequestAddResourceWithBuffer0600
     * @tc.desc      : Add resource by arrayBuffer when resourceType is video resource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestAddResourceWithBuffer0600', 2, async function (done) {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0600';
      try {
        let ret = mediaLibrary.testChangeRequestAddResourceWithBuffer(7);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_NATIVE_0100
     * @tc.name      : TestChangeRequestSaveCameraPhoto0100
     * @tc.desc      : Save camera photo when changeRequest is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestSaveCameraPhoto0100', 2, async function (done) {
      let testNum = 'TestChangeRequestSaveCameraPhoto0100';
      try {
        let ret = mediaLibrary.testChangeRequestSaveCameraPhoto(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_NATIVE_0200
     * @tc.name      : TestChangeRequestSaveCameraPhoto0200
     * @tc.desc      : Save camera photo when imageFileType is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestSaveCameraPhoto0200', 2, async function (done) {
      let testNum = 'TestChangeRequestSaveCameraPhoto0200';
      try {
        let ret = mediaLibrary.testChangeRequestSaveCameraPhoto(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_DISCARD_CAMERA_PHOTO_NATIVE_0100
     * @tc.name      : TestChangeRequestDiscardCameraPhoto0100
     * @tc.desc      : Discard camera photo when changeRequest is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestDiscardCameraPhoto0100', 2, async function (done) {
      let testNum = 'TestChangeRequestDiscardCameraPhoto0100';
      try {
        let ret = mediaLibrary.testChangeRequestDiscardCameraPhoto(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_RELEASE_NATIVE_0100
     * @tc.name      : TestChangeRequestRelease0100
     * @tc.desc      : Release media asset change request object when changeRequest is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestChangeRequestRelease0100', 2, async function (done) {
      let testNum = 'TestChangeRequestRelease0100';
      try {
        let ret = mediaLibrary.testChangeRequestRelease(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0100
     * @tc.name      : TestManagerRequestImage0100
     * @tc.desc      : Request image resource when mediaAsset is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestManagerRequestImage0100', 2, async function (done) {
      let testNum = 'TestManagerRequestImage0100';
      try {
        let ret = mediaLibrary.testManagerRequestImage(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0200
     * @tc.name      : TestManagerRequestImage0200
     * @tc.desc      : Request image resource when manager is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestManagerRequestImage0200', 2, async function (done) {
      let testNum = 'TestManagerRequestImage0200';
      try {
        let ret = mediaLibrary.testManagerRequestImage(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0300
     * @tc.name      : TestManagerRequestImage0300
     * @tc.desc      : Request image resource when deliveryMode is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestManagerRequestImage0300', 2, async function (done) {
      let testNum = 'TestManagerRequestImage0300';
      try {
        let ret = mediaLibrary.testManagerRequestImage(3);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0400
     * @tc.name      : TestManagerRequestImage0400
     * @tc.desc      : Request image resource when requestId is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestManagerRequestImage0400', 2, async function (done) {
      let testNum = 'TestManagerRequestImage0400';
      try {
        let ret = mediaLibrary.testManagerRequestImage(4);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0500
     * @tc.name      : TestManagerRequestImage0500
     * @tc.desc      : Request image resource when callback is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestManagerRequestImage0500', 2, async function (done) {
      let testNum = 'TestManagerRequestImage0500';
      try {
        let ret = mediaLibrary.testManagerRequestImage(5);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_APPLY_CHANGES_NATIVE_0100
     * @tc.name      : TestMediaAccessHelperApplyChanges0100
     * @tc.desc      : Apply changes when changeRequest is invalid
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('TestMediaAccessHelperApplyChanges0100', 2, async function (done) {
      let testNum = 'TestMediaAccessHelperApplyChanges0100';
      try {
        let ret = mediaLibrary.testMediaAccessHelperApplyChanges(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_PARAMETER_ERROR);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  });
}
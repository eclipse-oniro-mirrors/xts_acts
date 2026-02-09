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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import mediaLibrary from "libentry.so";
import {
  photoKeys,
  getPermission,
  photoFetchOption,
  getFileAsset,
  getAssetId,
  isNum,
  photoType,
  driveFn,
  sleep,
} from '../common'

const TAG = "MEDIA_LIBRARY_LOGTAG_NATIVE";
const MEDIA_LIBRARY_OK = 0;
const MEDIA_LIBRARY_PARAMETER_ERROR = 401;
const MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED = 23800201;

export default function PhotoAccessHelperNativeTest() {

  describe('PhotoAccessHelperNativeTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   TestMediaAssetGetUri0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_URI_NATIVE_0100
     * @tc.desc   Get the uri of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetUri0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetUri0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetUri(1);
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
     * @tc.name   TestMediaAssetGetUri0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_URI_NATIVE_0200
     * @tc.desc   Get the uri of the media asset when uri is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetUri0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetUri0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetUri(2);
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
     * @tc.name   TestMediaAssetGetDisplayName0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DISPLAY_NAME_NATIVE_0100
     * @tc.desc   Get the displayName of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDisplayName0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDisplayName0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDisplayName(1);
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
     * @tc.name   TestMediaAssetGetDisplayName0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DISPLAY_NAME_NATIVE_0200
     * @tc.desc   Get the displayName of the media asset when displayName is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDisplayName0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDisplayName0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDisplayName(2);
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
     * @tc.name   TestMediaAssetGetSize0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_SIZE_NATIVE_0100
     * @tc.desc   Get the size of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetSize0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetSize0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetSize(1);
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
     * @tc.name   TestMediaAssetGetSize0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_SIZE_NATIVE_0200
     * @tc.desc   Get the size of the media asset when size is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetSize0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetSize0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetSize(2);
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
     * @tc.name   TestMediaAssetGetDateModifiedMs0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_MODIFIED_MS_NATIVE_0100
     * @tc.desc   Get the dateModifiedMs of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateModifiedMs0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateModifiedMs0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateModifiedMs(1);
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
     * @tc.name   TestMediaAssetGetDateModifiedMs0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_MODIFIED_MS_NATIVE_0200
     * @tc.desc   Get the dateModifiedMs of the media asset when dateModifiedMs is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateModifiedMs0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateModifiedMs0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateModifiedMs(2);
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
     * @tc.name   TestMediaAssetGetWidth0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_WIDTH_NATIVE_0100
     * @tc.desc   Get the width of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetWidth0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetWidth0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetWidth(1);
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
     * @tc.name   TestMediaAssetGetWidth0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_WIDTH_NATIVE_0200
     * @tc.desc   Get the width of the media asset when width is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetWidth0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetWidth0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetWidth(2);
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
     * @tc.name   TestMediaAssetGetHeight0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_HEIGHT_NATIVE_0100
     * @tc.desc   Get the height of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetHeight0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetHeight0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetHeight(1);
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
     * @tc.name   TestMediaAssetGetHeight0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_HEIGHT_NATIVE_0200
     * @tc.desc   Get the height of the media asset when height is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetHeight0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetHeight0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetHeight(2);
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
     * @tc.name   TestMediaAssetGetOrientation0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_ORIENTATION_NATIVE_0100
     * @tc.desc   Get the orientation of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetOrientation0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetOrientation0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetOrientation(1);
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
     * @tc.name   TestMediaAssetGetOrientation0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_ORIENTATION_NATIVE_0200
     * @tc.desc   Get the orientation of the media asset when orientation is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetOrientation0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetOrientation0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetOrientation(2);
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
     * @tc.name   TestMediaAssetRelease0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_RELEASE_NATIVE_0100
     * @tc.desc   Release media asset object when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetRelease0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetRelease0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetRelease(1);
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
     * @tc.name   TestChangeRequestAddResourceWithBuffer0100
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0100
     * @tc.desc   Add resource by arrayBuffer when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithBuffer0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0100';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithBuffer(1);
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
     * @tc.name   TestChangeRequestAddResourceWithBuffer0200
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0200
     * @tc.desc   Add resource by arrayBuffer when resourceType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithBuffer0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0200';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithBuffer(2);
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
     * @tc.name   TestChangeRequestAddResourceWithBuffer0300
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0300
     * @tc.desc   Add resource by arrayBuffer when buffer is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithBuffer0300', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0300';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithBuffer(3);
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
     * @tc.name   TestChangeRequestAddResourceWithBuffer0400
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0400
     * @tc.desc   Add resource by arrayBuffer when length is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithBuffer0400', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0400';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithBuffer(4);
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
     * @tc.name   TestChangeRequestAddResourceWithBuffer0500
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0500
     * @tc.desc   Add resource by arrayBuffer when resourceType is image resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithBuffer0500', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0500';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithBuffer(6);
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
     * @tc.name   TestChangeRequestAddResourceWithBuffer0600
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_BUFFER_NATIVE_0600
     * @tc.desc   Add resource by arrayBuffer when resourceType is video resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithBuffer0600', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithBuffer0600';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithBuffer(7);
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
     * @tc.name   TestChangeRequestSaveCameraPhoto0100
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_NATIVE_0100
     * @tc.desc   Save camera photo when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestSaveCameraPhoto0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestSaveCameraPhoto0100';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestSaveCameraPhoto(1);
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
     * @tc.name   TestChangeRequestSaveCameraPhoto0200
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_NATIVE_0200
     * @tc.desc   Save camera photo when imageFileType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestSaveCameraPhoto0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestSaveCameraPhoto0200';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestSaveCameraPhoto(2);
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
     * @tc.name   TestChangeRequestSaveCameraVideo0100
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_VIDEO_NATIVE_0100
     * @tc.desc   Save camera video when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestSaveCameraVideo0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestSaveCameraVideo0100';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestSaveCameraVideo(1);
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
     * @tc.name   TestChangeRequestSaveCameraVideo0200
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_VIDEO_NATIVE_0200
     * @tc.desc   Save camera video when imageFileType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestSaveCameraVideo0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestSaveCameraVideo0200';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestSaveCameraVideo(2);
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
     * @tc.name   TestChangeRequestDiscardCameraPhoto0100
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_DISCARD_CAMERA_PHOTO_NATIVE_0100
     * @tc.desc   Discard camera photo when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestDiscardCameraPhoto0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestDiscardCameraPhoto0100';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestDiscardCameraPhoto(1);
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
     * @tc.name   TestChangeRequestRelease0100
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_RELEASE_NATIVE_0100
     * @tc.desc   Release media asset change request object when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestRelease0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestRelease0100';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestRelease(1);
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
     * @tc.name   TestManagerRequestImage0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0100
     * @tc.desc   Request image resource when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestImage0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestImage0100';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestImage(2);
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
     * @tc.name   TestManagerRequestImage0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0200
     * @tc.desc   Request image resource when manager is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestImage0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestImage0200';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestImage(1);
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
     * @tc.name   TestManagerRequestImage0300
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0300
     * @tc.desc   Request image resource when deliveryMode is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestImage0300', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestImage0300';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestImage(3);
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
     * @tc.name   TestManagerRequestImage0400
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0400
     * @tc.desc   Request image resource when requestId is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestImage0400', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestImage0400';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestImage(4);
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
     * @tc.name   TestManagerRequestImage0500
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_IMAGE_NATIVE_0500
     * @tc.desc   Request image resource when callback is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestImage0500', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestImage0500';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestImage(5);
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
     * @tc.name   TestMediaAccessHelperApplyChanges0100
     * @tc.number SUB_PHOTOACCESS_HELPER_APPLY_CHANGES_NATIVE_0100
     * @tc.desc   Apply changes when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAccessHelperApplyChanges0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAccessHelperApplyChanges0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAccessHelperApplyChanges(1);
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
     * @tc.name   TestMediaAssetGetMediaType0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_MEDIA_TYPE_NATIVE_0100
     * @tc.desc   Get the mediaType of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetMediaType0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetMediaType0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetMediaType(1);
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
     * @tc.name   TestMediaAssetGetMediaType0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_MEDIA_TYPE_NATIVE_0200
     * @tc.desc   Get the mediaType of the media asset when mediaType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetMediaType0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetMediaType0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetMediaType(2);
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
     * @tc.name   TestMediaAssetGetMediaSubType0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_MEDIA_SUB_TYPE_NATIVE_0100
     * @tc.desc   Get the mediaSubType of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetMediaSubType0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetMediaSubType0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetMediaSubType(1);
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
     * @tc.name   TestMediaAssetGetMediaSubType0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_MEDIA_SUB_TYPE_NATIVE_0200
     * @tc.desc   Get the mediaSubType of the media asset when mediaSubType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetMediaSubType0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetMediaSubType0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetMediaSubType(2);
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
     * @tc.name   TestMediaAssetGetDateAdded0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_ADDED_NATIVE_0100
     * @tc.desc   Get the dateAdded of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateAdded0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateAdded0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateAdded(1);
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
     * @tc.name   TestMediaAssetGetDateAdded0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_ADDED_NATIVE_0200
     * @tc.desc   Get the dateAdded of the media asset when dateAdded is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateAdded0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateAdded0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateAdded(2);
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
     * @tc.name   TestMediaAssetGetDateModified0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_MODIFIED_NATIVE_0100
     * @tc.desc   Get the dateModified of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateModified0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateModified0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateModified(1);
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
     * @tc.name   TestMediaAssetGetDateModified0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_MODIFIED_NATIVE_0200
     * @tc.desc   Get the dateModified of the media asset when dateModified is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateModified0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateModified0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateModified(2);
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
     * @tc.name   TestMediaAssetGetDateTaken0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_TAKEN_NATIVE_0100
     * @tc.desc   Get the dateTaken of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateTaken0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateTaken0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateTaken(1);
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
     * @tc.name   TestMediaAssetGetDateTaken0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_TAKEN_NATIVE_0200
     * @tc.desc   Get the dateTaken of the media asset when dateTaken is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateTaken0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateTaken0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateTaken(2);
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
     * @tc.name   TestMediaAssetGetDateAddedMs0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_ADDED_MS_NATIVE_0100
     * @tc.desc   Get the dateAddedMs of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateAddedMs0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateAddedMs0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateAddedMs(1);
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
     * @tc.name   TestMediaAssetGetDateAddedMs0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DATE_ADDED_MS_NATIVE_0200
     * @tc.desc   Get the dateAddedMs of the media asset when dateAddedMs is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDateAddedMs0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDateAddedMs0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDateAddedMs(2);
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
     * @tc.name   TestMediaAssetGetDuration0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DURATION_NATIVE_0100
     * @tc.desc   Get the duration of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDuration0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDuration0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDuration(1);
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
     * @tc.name   TestMediaAssetGetDuration0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_DURATION_NATIVE_0200
     * @tc.desc   Get the duration of the media asset when duration is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetDuration0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetDuration0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetDuration(2);
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
     * @tc.name   TestMediaAssetIsFavorite0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_IS_FAVORITE_NATIVE_0100
     * @tc.desc   Get the favorite of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetIsFavorite0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetIsFavorite0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetIsFavorite(1);
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
     * @tc.name   TestMediaAssetIsFavorite0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_IS_FAVORITE_NATIVE_0200
     * @tc.desc   Get the favorite of the media asset when favorite is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetIsFavorite0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetIsFavorite0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetIsFavorite(2);
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
     * @tc.name   TestMediaAssetGetTitle0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_TITLE_NATIVE_0100
     * @tc.desc   Get the title of the media asset when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetTitle0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetTitle0100';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetTitle(1);
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
     * @tc.name   TestMediaAssetGetTitle0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MEDIA_ASSET_GET_TITLE_NATIVE_0200
     * @tc.desc   Get the title of the media asset when title is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMediaAssetGetTitle0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMediaAssetGetTitle0200';
      try {
        let ret:ESObject = mediaLibrary.testMediaAssetGetTitle(2);
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
     * @tc.name   TestChangeRequestAddResourceWithUri0100
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_NATIVE_0100
     * @tc.desc   Add resource by fileUri when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithUri0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithUri0100';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithUri(1);
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
     * @tc.name   TestChangeRequestAddResourceWithUri0200
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_NATIVE_0200
     * @tc.desc   Add resource by fileUri when resourceType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithUri0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithUri0200';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithUri(2);
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
     * @tc.name   TestChangeRequestAddResourceWithUri0300
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_NATIVE_0300
     * @tc.desc   Add resource by fileUri when requestUri is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithUri0300', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithUri0300';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithUri(3);
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
     * @tc.name   TestChangeRequestAddResourceWithUri0400
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_NATIVE_0400
     * @tc.desc   Add resource by fileUri when resourceType is image type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithUri0400', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithUri0400';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithUri(6);
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
     * @tc.name   TestChangeRequestAddResourceWithUri0500
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_ADD_RESOURCE_WITH_URI_NATIVE_0500
     * @tc.desc   Add resource by fileUri when resourceType is video type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestAddResourceWithUri0500', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestAddResourceWithUri0500';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestAddResourceWithUri(7);
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
     * @tc.name   TestChangeRequestGetWriteCacheHandler0100
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_NATIVE_0100
     * @tc.desc   Get write cache handler of image when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestGetWriteCacheHandler0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestGetWriteCacheHandler0100';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestGetWriteCacheHandler(1);
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
     * @tc.name   TestChangeRequestGetWriteCacheHandler0200
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_NATIVE_0200
     * @tc.desc   Get write cache handler of image when fd is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestGetWriteCacheHandler0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestGetWriteCacheHandler0200';
      try {
        let ret:ESObject = mediaLibrary.testChangeRequestGetWriteCacheHandler(2);
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
     * @tc.name   TestManagerRequestMovingPhoto0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_MOVING_PHOTO_NATIVE_0100
     * @tc.desc   Request moving photo object when manager is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestMovingPhoto0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestMovingPhoto0100';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestMovingPhoto(1);
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
     * @tc.name   TestManagerRequestMovingPhoto0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_MOVING_PHOTO_NATIVE_0200
     * @tc.desc   Request moving photo object when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestMovingPhoto0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestMovingPhoto0200';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestMovingPhoto(2);
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
     * @tc.name   TestManagerRequestMovingPhoto0002
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_MOVING_PHOTO_NATIVE_0300
     * @tc.desc   Request moving photo object when deliveryMode is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestMovingPhoto0002', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestMovingPhoto0002';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestMovingPhoto(3);
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
     * @tc.name   TestManagerRequestMovingPhoto0400
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_MOVING_PHOTO_NATIVE_0400
     * @tc.desc   Request moving photo object when requestId is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestMovingPhoto0400', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestMovingPhoto0400';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestMovingPhoto(4);
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
     * @tc.name   TestManagerRequestMovingPhoto0500
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_MOVING_PHOTO_NATIVE_0500
     * @tc.desc   Request moving photo object when callback is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRequestMovingPhoto0500', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRequestMovingPhoto0500';
      try {
        let ret:ESObject = mediaLibrary.testManagerRequestMovingPhoto(5);
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
     * @tc.name   TestManagerRelease0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_RELEASE_NATIVE_0100
     * @tc.desc   Release media asset manager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRelease0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRelease0100';
      try {
        let ret:ESObject = mediaLibrary.testManagerRelease(0);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_OK);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.name   TestManagerRelease0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_RELEASE_NATIVE_0200
     * @tc.desc   Release media asset manager when manager is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestManagerRelease0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestManagerRelease0200';
      try {
        let ret:ESObject = mediaLibrary.testManagerRelease(1);
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
     * @tc.name   TestMovingPhotoGetUri0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_GET_URI_NATIVE_0100
     * @tc.desc   Get uri of moving photo when movingPhoto is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoGetUri0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoGetUri0100';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoGetUri(1);
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
     * @tc.name   TestMovingPhotoGetUri0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_GET_URI_NATIVE_0200
     * @tc.desc   Get uri of moving photo when uri is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoGetUri0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoGetUri0200';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoGetUri(2);
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
     * @tc.name   TestMovingPhotoRequestContentWithUris0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_URIS_NATIVE_0100
     * @tc.desc   Request the image content and video content of the moving photo when movingPhoto is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithUris0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithUris0100';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithUris(1);
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
     * @tc.name   TestMovingPhotoRequestContentWithUris0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_URIS_NATIVE_0200
     * @tc.desc   Request the image content and video content of the moving photo when imageUri is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithUris0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithUris0200';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithUris(2);
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
     * @tc.name   TestMovingPhotoRequestContentWithUris0300
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_URIS_NATIVE_0300
     * @tc.desc   Request the image content and video content of the moving photo when videoUri is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithUris0300', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithUris0300';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithUris(3);
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
     * @tc.name   TestMovingPhotoRequestContentWithUri0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_URI_NATIVE_0100
     * @tc.desc   Request the image content or video content of the moving photo when movingPhoto is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithUri0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithUri0100';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithUri(1);
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
     * @tc.name   TestMovingPhotoRequestContentWithUri0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_URI_NATIVE_0200
     * @tc.desc   Request the image content or video content of the moving photo when resourceType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithUri0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithUri0200';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithUri(2);
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
     * @tc.name   TestMovingPhotoRequestContentWithUri0300
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_URI_NATIVE_0300
     * @tc.desc   Request the image content or video content of the moving photo when imageUri is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithUri0300', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithUri0300';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithUri(3);
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
     * @tc.name   TestMovingPhotoRequestContentWithUri0400
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_URI_NATIVE_0400
     * @tc.desc   Request the image content or video content of the moving photo when resourceType is image type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithUri0400', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithUri0400';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithUri(6);
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
     * @tc.name   TestMovingPhotoRequestContentWithUri0500
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_URI_NATIVE_0500
     * @tc.desc   Request the image content or video content of the moving photo when resourceType is video type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithUri0500', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithUri0500';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithUri(7);
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
     * @tc.name   TestMovingPhotoRequestContentWithBuffer0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_BUFFER_NATIVE_0100
     * @tc.desc   Request the moving photo content with buffer when movingPhoto is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithBuffer0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithBuffer0100';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithBuffer(1);
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
     * @tc.name   TestMovingPhotoRequestContentWithBuffer0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_BUFFER_NATIVE_0200
     * @tc.desc   Request the moving photo content with buffer when resourceType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithBuffer0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithBuffer0200';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithBuffer(2);
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
     * @tc.name   TestMovingPhotoRequestContentWithBuffer0300
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_BUFFER_NATIVE_0300
     * @tc.desc   Request the moving photo content with buffer when buffer is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithBuffer0300', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithBuffer0300';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithBuffer(3);
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
     * @tc.name   TestMovingPhotoRequestContentWithBuffer0400
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_BUFFER_NATIVE_0400
     * @tc.desc   Request the moving photo content with buffer when size is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithBuffer0400', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithBuffer0400';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithBuffer(4);
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
     * @tc.name   TestMovingPhotoRequestContentWithBuffer0500
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_BUFFER_NATIVE_0500
     * @tc.desc   Request the moving photo content with buffer when resourceType is image type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithBuffer0500', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithBuffer0500';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithBuffer(6);
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
     * @tc.name   TestMovingPhotoRequestContentWithBuffer0005
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_CONTENT_WITH_BUFFER_NATIVE_0600
     * @tc.desc   Request the moving photo content with buffer when resourceType is video type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRequestContentWithBuffer0005', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRequestContentWithBuffer0005';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRequestContentWithBuffer(7);
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
     * @tc.name   TestMovingPhotoRelease0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MOVING_PHOTO_REQUEST_RELEASE_NATIVE_0100
     * @tc.desc   Release moving photo when movingPhoto is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestMovingPhotoRelease0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestMovingPhotoRelease0100';
      try {
        let ret:ESObject = mediaLibrary.testMovingPhotoRelease(1);
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
     * @tc.name   testManagerQuickRequestImage0100
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_QUICK_IMAGE_NATIVE_0100
     * @tc.desc   Request quick image resource when mediaAsset is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testManagerQuickRequestImage0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'testManagerQuickRequestImage0100';
      try {
        let ret:ESObject = mediaLibrary.testManagerQuickRequestImage(2);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
 
    /**
     * @tc.name   testManagerQuickRequestImage0200
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_QUICK_IMAGE_NATIVE_0200
     * @tc.desc   Request quick image resource when manager is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testManagerQuickRequestImage0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'testManagerQuickRequestImage0200';
      try {
        let ret:ESObject = mediaLibrary.testManagerQuickRequestImage(1);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
 
    /**
     * @tc.name   testManagerQuickRequestImage0300
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_QUICK_IMAGE_NATIVE_0300
     * @tc.desc   Request quick image resource when deliveryMode is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testManagerQuickRequestImage0300', Level.LEVEL2, (done: Function) => {
      let testNum = 'testManagerQuickRequestImage0300';
      try {
        let ret:ESObject = mediaLibrary.testManagerQuickRequestImage(3);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
 
    /**
     * @tc.name   testManagerQuickRequestImage0400
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_QUICK_IMAGE_NATIVE_0400
     * @tc.desc   Request quick image resource when requestId is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testManagerQuickRequestImage0400', Level.LEVEL2, (done: Function) => {
      let testNum = 'testManagerQuickRequestImage0400';
      try {
        let ret:ESObject = mediaLibrary.testManagerQuickRequestImage(4);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
 
    /**
     * @tc.name   testManagerQuickRequestImage0500
     * @tc.number SUB_PHOTOACCESS_HELPER_MANAGER_REQUEST_QUICK_IMAGE_NATIVE_0500
     * @tc.desc   Request quick image resource when callback is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testManagerQuickRequestImage0500', Level.LEVEL2, (done: Function) => {
      let testNum = 'testManagerQuickRequestImage0500';
      try {
        let ret:ESObject = mediaLibrary.testManagerQuickRequestImage(5);
        console.log(`${testNum} ret: ${ret}`);
        expect(ret).assertEqual(MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   TestChangeRequestSaveCameraImageHeif0100
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_IMAGE_HEIF_NATIVE_0100
     * @tc.desc   Save camera photo when changeRequest is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestSaveCameraImageHeif0100', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestSaveCameraImageHeif0100';
      try {
        let ret: ESObject = mediaLibrary.testChangeRequestSaveCameraImageHeif(1);
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
     * @tc.name   TestChangeRequestSaveCameraImageHeif0200
     * @tc.number SUB_PHOTOACCESS_HELPER_CHANGE_REQUEST_SAVE_CAMERA_IMAGE_HEIF_NATIVE_0200
     * @tc.desc   Save camera photo when imageFileType is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TestChangeRequestSaveCameraImageHeif0200', Level.LEVEL2, (done: Function) => {
      let testNum = 'TestChangeRequestSaveCameraImageHeif0200';
      try {
        let ret: ESObject = mediaLibrary.testChangeRequestSaveCameraImageHeif(2);
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
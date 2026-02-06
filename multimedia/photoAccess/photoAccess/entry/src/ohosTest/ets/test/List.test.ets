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
import getPhotoAccessHelperTest from './getPhotoAccessHelper.test';
import provisionResourcesTest from './provisionResources.test';
import checkAlbumAttrTest from './AbsAlbum/checkAttr.test';
import albumGetAssetsTest from './AbsAlbum/getAssets.test';
import addAssetsTest from './Album/addAssets.test';
import albumCommitModifyTest from './Album/commitModify.test';
import removeAssetsTest from './Album/removeAssets.test';
import albumCloseTest from './AlbumFetchResult/close.test';
import albumGetAllObjectTest from './AlbumFetchResult/getAllObjects.test';
import albumGetCountTest from './AlbumFetchResult/getCount.test';
import albumGetFirstObjectTest from './AlbumFetchResult/getFirstObject.test';
import albumGetLastObjectTest from './AlbumFetchResult/getLastObject.test';
import albumGetNextObjectTest from './AlbumFetchResult/getNextObject.test';
import albumGetPositionObjectTest from './AlbumFetchResult/getObjectByPosition.test';
import albumIsAfterLastTest from './AlbumFetchResult/isAfterLast.test';
import setAlbumNameChangeRequestTest from './MediaAlbumChangeRequest/setAlbumName.test';
import getAlbumChangeRequestTest from './MediaAlbumChangeRequest/getAlbum.test';
import addRemoveAssetsChangeRequestTest from './MediaAlbumChangeRequest/addRemoveAssets.test';
import createAssetRequestTest from './MediaAssetChangeRequest/createAssetRequest.test';
import createImageAssetRequestTest from './MediaAssetChangeRequest/createImageAssetRequest.test';
import createVideoAssetRequestTest from './MediaAssetChangeRequest/createVideoAssetRequest.test';
import deleteAssetsChangeRequestTest from './MediaAssetChangeRequest/deleteAssets.test';
import getAssetChangeRequestTest from './MediaAssetChangeRequest/getAsset.test';
import setTitleChangeRequestTest from './MediaAssetChangeRequest/setTitle.test';
import addResourceChangeRequestTest from './MediaAssetChangeRequest/addResource.test';
import getWriteCacheHandlerTest from './MediaAssetChangeRequest/getWriteCacheHandler.test';
import handleCameraPhotoTest from './MediaAssetChangeRequest/handleCameraPhoto.test';
import requestImageTest from './MediaAssetManager/requestImage.test';
import requestImageDataTest from './MediaAssetManager/requestImageData.test';
import requestVideoNativeTest from './MediaAssetManager/requestVideoNative.test';
import requestImageNativeTest from './MediaAssetManager/requestImageNative.test';
import requestCancelNativeTest from './MediaAssetManager/requestCancelNative.test';
import requestVideoTest from './MediaAssetManager/requestVideo.test';
import getMovingPhotoTest from './PhotoAccessHelper/getMovingPhoto.test';
import getMovingPhotoTranscodeTest from './PhotoAccessHelper/getMovingPhotoTranscode.test';
import showAssetsCreationDialogTest from './PhotoAccessHelper/showAssetsCreationDialog.test';
import PhotoAccessHelperNativeTest from './PhotoAccessHelper/photoAccessHelperNative.test';
import getBurstAssetsTest from './PhotoAccessHelper/getBurstAssets.test';
import createAssetTest from './PhotoAccessHelper/createAsset.test';
import createDeleteRequestTest from './PhotoAccessHelper/createDeleteRequest.test';
import getAlbumsTest from './PhotoAccessHelper/getAlbums.test';
import getAssetsTest from './PhotoAccessHelper/getAssets.test';
import unRegisterChangeTest from './PhotoAccessHelper/unRegisterChange.test';
import registerChangeTest from './PhotoAccessHelper/registerChange.test';
import releaseTest from './PhotoAccessHelper/release.test';
import photoPickerTest from './PhotoAccessHelper/photoPicker.test';
import PhotoAccessHelperCasesTest from  './PhotoAccessHelperCases/PhotoAccessHelperTest.test';
//import photoAccessHelperTest from './photoAccessHelperTest/PhotoAccessHelper.test';
import checkAttrTest from './PhotoAsset/checkAttr.test';
import closeTest from './PhotoAsset/close.test';
import commitModifyTest from './PhotoAsset/commitModify.test';
import getTest from './PhotoAsset/get.test';
import getReadOnlyFdTest from './PhotoAsset/getReadOnlyFd.test';
import getThumbnailTest from './PhotoAsset/getThumbnail.test';
import assetCloseTest from './PhotoAssetFetchResult/close.test';
import assetGetAllObjectTest from './PhotoAssetFetchResult/getAllObjects.test';
import assetGetCountTest from './PhotoAssetFetchResult/getCount.test';
import assetGetFirstObjectTest from './PhotoAssetFetchResult/getFirstObject.test';
import assetGetLastObjectTest from './PhotoAssetFetchResult/getLastObject.test';
import assetGetNextObjectTest from './PhotoAssetFetchResult/getNextObject.test';
import assetGetPositionObjectTest from './PhotoAssetFetchResult/getObjectByPosition.test';
import assetIsAfterLastTest from './PhotoAssetFetchResult/isAfterLast.test';
import convertToCommonTest from './Sendable/convertToCommon.test';
import getSendableBurstAssetsTest from './Sendable/getSendableBurstAssets.test';
import setOrientationChangeRequestTest from './MediaAssetChangeRequest/setOrientation.test';
import convertToPhotoAlbumTest from './Sendable/Album/convertToPhotoAlbum.test'
import getSendableAlbumAssetsTest from './Sendable/Album/getSendableAlbumAssets.test'
import getSendableAlbumsTest from './Sendable/Album/getSendableAlbums.test'
import sendableAlbumModifyTest from './Sendable/Album/sendableAlbumModify.test'
import cloneAssetTest from './PhotoAsset/cloneAsset.test';
import getSupportedPhotoFormatsTest from './PhotoAccessHelper/getSupportedPhotoFormats';
import setTest from './PhotoAsset/set.test.ets';
import mediaAssetChangeRequestErrorTest from './MediaAssetChangeRequest/mediaAssetChangeRequestError.test.ets';
import positionTypeTest from './PhotoAccessHelper/positionType.test'
import registerPhotoChangeTest from './PhotoAccessHelper/registerPhotoChange.test'
import manageRiskPermissionTest from './PhotoAccessHelper/manageRiskPermission.test'

export default function testsuite() {
  provisionResourcesTest();
  getPhotoAccessHelperTest();
  checkAlbumAttrTest();
  albumGetAssetsTest();
  addAssetsTest();
  albumCommitModifyTest();
  removeAssetsTest();
  albumCloseTest();
  albumGetAllObjectTest();
  albumGetCountTest();
  albumGetFirstObjectTest();
  albumGetLastObjectTest();
  albumGetNextObjectTest();
  albumGetPositionObjectTest();
  albumIsAfterLastTest();
  setAlbumNameChangeRequestTest();
  getAlbumChangeRequestTest();
  addRemoveAssetsChangeRequestTest();
  createAssetRequestTest();
  createImageAssetRequestTest();
  createVideoAssetRequestTest();
  deleteAssetsChangeRequestTest();
  getAssetChangeRequestTest();
  setTitleChangeRequestTest();
  addResourceChangeRequestTest();
  getWriteCacheHandlerTest();
  handleCameraPhotoTest();
  mediaAssetChangeRequestErrorTest();
  requestImageTest();
  requestImageDataTest();
  requestVideoNativeTest();
  requestImageNativeTest();
  requestCancelNativeTest();
  requestVideoTest();
  getMovingPhotoTest();
  getMovingPhotoTranscodeTest();
  showAssetsCreationDialogTest();
  PhotoAccessHelperNativeTest();
  getBurstAssetsTest();
  createAssetTest();
  createDeleteRequestTest();
  getAlbumsTest();
  getAssetsTest();
  unRegisterChangeTest();
  registerChangeTest();
  releaseTest();
  photoPickerTest();
  PhotoAccessHelperCasesTest();
  //photoAccessHelperTest();
  checkAttrTest();
  closeTest();
  commitModifyTest();
  getTest();
  getReadOnlyFdTest();
  getThumbnailTest();
  assetCloseTest();
  assetGetAllObjectTest();
  assetGetCountTest();
  assetGetFirstObjectTest();
  assetGetLastObjectTest();
  assetGetNextObjectTest();
  assetGetPositionObjectTest();
  assetIsAfterLastTest();
  convertToCommonTest();
  getSendableBurstAssetsTest();
  convertToPhotoAlbumTest();
  getSendableAlbumAssetsTest();
  getSendableAlbumsTest();
  sendableAlbumModifyTest();
  setOrientationChangeRequestTest();
  cloneAssetTest();
  getSupportedPhotoFormatsTest();
  setTest();
  positionTypeTest();
  registerPhotoChangeTest();
  manageRiskPermissionTest();
}
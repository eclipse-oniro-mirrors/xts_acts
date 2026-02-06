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

import createAssetTest from "./PhotoAccessHelper/createAsset.test"
import getThumbnailTest from "./PhotoAsset/getThumbnail.test"
import assetGetCountTest from "./PhotoAssetFetchResult/getCount.test"
import assetGetFirstObjectTest from "./PhotoAssetFetchResult/getFirstObject.test"
import assetCloseTest from "./PhotoAssetFetchResult/close.test"
import getAssetsTest from "./PhotoAccessHelper/getAssets.test"
import releaseTest from "./PhotoAccessHelper/release.test"
import getTest from "./PhotoAsset/get.test"
import albumGetAssetsTest from "./AbsAlbum/getAssets.test.ets"
import cloneAssetTest from "./PhotoAsset/cloneAsset.test"
import setTest from "./PhotoAsset/set.test"
import commitModifyTest from "./PhotoAsset/commitModify.test"
import albumCloseTest from "./AlbumFetchResult/close.test.ets"
import albumGetAllObjectTest from "./AlbumFetchResult/getAllObjects.test.ets"
import albumGetCountTest from "./AlbumFetchResult/getCount.test.ets"
import albumGetFirstObjectTest from "./AlbumFetchResult/getFirstObject.test.ets"
import albumGetLastObjectTest from "./AlbumFetchResult/getLastObject.test.ets"
import albumGetNextObjectTest from "./AlbumFetchResult/getNextObject.test.ets"
import albumGetPositionObjectTest from "./AlbumFetchResult/getObjectByPosition.test.ets"
import albumIsAfterLastTest from "./AlbumFetchResult/isAfterLast.test.ets"
import addResource from "./MediaAssetChangeRequest/addResource.test.ets"
import createAssetRequest from "./MediaAssetChangeRequest/createAssetRequest.test.ets"
import createImageAssetRequest from "./MediaAssetChangeRequest/createImageAssetRequest.test.ets"
import createVideoAssetRequest from "./MediaAssetChangeRequest/createVideoAssetRequest.test.ets"
import deleteAssets from "./MediaAssetChangeRequest/deleteAssets.test.ets"
import getAsset from "./MediaAssetChangeRequest/getAsset.test.ets"
import getWriteCacheHandlerTest from "./MediaAssetChangeRequest/getWriteCacheHandler.test.ets"
import handleCameraPhotoTest from "./MediaAssetChangeRequest/handleCameraPhoto.test.ets"
import setTitleChangeRequestTest from "./MediaAssetChangeRequest/setTitle.test.ets"
import setOrientationChangeRequestTest from "./MediaAssetChangeRequest/setOrientation.test.ets"
import requestImageTest from "./MediaAssetManager/requestImage.test.ets"
import requestImageDataTest from "./MediaAssetManager/requestImageData.test.ets"
import requestVideoTest from "./MediaAssetManager/requestVideo.test.ets"
import getAlbumsTest from "./PhotoAccessHelper/getAlbums.test.ets"
import getBurstAssetsTest from "./PhotoAccessHelper/getBurstAssets.test.ets"
import getMovingPhotoTest from "./PhotoAccessHelper/getMovingPhoto.test.ets"
import getSupportedPhotoFormatsTest from "./PhotoAccessHelper/getSupportedPhotoFormats.ets"
import unRegisterChangeTest from "./PhotoAccessHelper/unRegisterChange.test.ets"
import PhotoAccessHelperTest from "./PhotoAccessHelperCases/PhotoAccessHelperTest.test.ets"
import photoAccessHelperTest from "./photoAccessHelperTest/PhotoAccessHelper.test.ets"
import checkAttrTest from "./PhotoAsset/checkAttr.test.ets"
import assetGetAllObjectTest from "./PhotoAssetFetchResult/getAllObjects.test.ets"
import assetGetLastObjectTest from "./PhotoAssetFetchResult/getLastObject.test.ets"
import assetGetNextObjectTest from "./PhotoAssetFetchResult/getNextObject.test.ets"
import assetGetPositionObjectTest from "./PhotoAssetFetchResult/getObjectByPosition.test.ets"
import assetIsAfterLastTest from "./PhotoAssetFetchResult/isAfterLast.test.ets"
import GetPhotoAccessHelper from "./GetPhotoAccessHelper.test.ets"
import provisionResourcesTest from "./ProvisionResources.test.ets"
import PhotoAccessHelperStaticTest from "./PhotoAccessHelper.test.ets"
import addAssetsTest from "./Album/addAssets.test.ets"
import albumCommitModifyTest from "./Album/commitModify.test.ets"
import removeAssetsTest from "./Album/removeAssets.test.ets"
import getAlbumChangeRequestTest from "./MediaAlbumChangeRequest/getAlbum.test.ets"
import setAlbumNameChangeRequestTest from "./MediaAlbumChangeRequest/setAlbumName.test.ets"
import registerPhotoChangeTest from "./PhotoAccessHelper/registerPhotoChange.test.ets"

export default function testsuite() {
  provisionResourcesTest();
  GetPhotoAccessHelper();
  PhotoAccessHelperStaticTest();
  albumGetAssetsTest();
  albumCloseTest();
  albumGetAllObjectTest();
  albumGetCountTest();
  albumGetFirstObjectTest();
  albumGetLastObjectTest();
  albumGetNextObjectTest();
  albumGetPositionObjectTest();
  albumIsAfterLastTest();
  addResource();
  createAssetRequest();
  createImageAssetRequest();
  createVideoAssetRequest();
  deleteAssets();
  getAsset();
  getWriteCacheHandlerTest();
  handleCameraPhotoTest();
  requestImageTest();
  requestImageDataTest();
  requestVideoTest();
  getBurstAssetsTest();
  createAssetTest();
  getAlbumsTest();
  getAssetsTest();
  unRegisterChangeTest();
  releaseTest();
  PhotoAccessHelperTest();
  photoAccessHelperTest();
  checkAttrTest();
  commitModifyTest();
  getTest();
  getThumbnailTest();
  assetCloseTest();
  assetGetAllObjectTest();
  assetGetCountTest();
  assetGetFirstObjectTest();
  assetGetLastObjectTest();
  assetGetNextObjectTest();
  assetGetPositionObjectTest();
  assetIsAfterLastTest();
  setTitleChangeRequestTest();
  setOrientationChangeRequestTest();
  cloneAssetTest();
  // getMovingPhotoTest();
  getSupportedPhotoFormatsTest();
  setTest();
  addAssetsTest();
  albumCommitModifyTest();
  removeAssetsTest();
  getAlbumChangeRequestTest();
  setAlbumNameChangeRequestTest();
  registerPhotoChangeTest();
}
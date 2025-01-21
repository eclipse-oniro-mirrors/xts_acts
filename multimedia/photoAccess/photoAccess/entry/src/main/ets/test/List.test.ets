/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import provisionResourcesTest from './provisionResources'
import checkAlbumAttrTest from './AbsAlbum/checkAttr'
import albumGetAssetsTest from './AbsAlbum/getAssets'
import addAssetsTest from './Album/addAssets'
import albumCommitModifyTest from './Album/commitModify'
import removeAssetsTest from './Album/removeAssets'
import getPhotoAccessHelperTest from './getPhotoAccessHelper'
import albumCloseTest from './AlbumFetchResult/close'
import albumGetAllObjectTest from './AlbumFetchResult/getAllObjects'
import albumGetCountTest from './AlbumFetchResult/getCount'
import albumGetFirstObjectTest from './AlbumFetchResult/getFirstObject'
import albumGetLastObjectTest from './AlbumFetchResult/getLastObject'
import albumGetNextObjectTest from './AlbumFetchResult/getNextObject'
import albumGetPositionObjectTest from './AlbumFetchResult/getObjectByPosition'
import albumIsAfterLastTest from './AlbumFetchResult/isAfterLast'
import assetCloseTest from './PhotoAssetFetchResult/close'
import assetGetAllObjectTest from './PhotoAssetFetchResult/getAllObjects'
import assetGetCountTest from './PhotoAssetFetchResult/getCount'
import assetGetFirstObjectTest from './PhotoAssetFetchResult/getFirstObject'
import assetGetLastObjectTest from './PhotoAssetFetchResult/getLastObject'
import assetGetNextObjectTest from './PhotoAssetFetchResult/getNextObject'
import assetGetPositionObjectTest from './PhotoAssetFetchResult/getObjectByPosition'
import assetIsAfterLastTest from './PhotoAssetFetchResult/isAfterLast'
import createAssetTest from './PhotoAccessHelper/createAsset'
import createDeleteRequestTest from './PhotoAccessHelper/createDeleteRequest'
import getAlbumsTest from './PhotoAccessHelper/getAlbums'
import getAssetsTest from './PhotoAccessHelper/getAssets'
import unRegisterChangeTest from './PhotoAccessHelper/unRegisterChange'
import registerChangeTest from './PhotoAccessHelper/registerChange'
import releaseTest from './PhotoAccessHelper/release'
import checkAttrTest from './PhotoAsset/checkAttr'
import closeTest from './PhotoAsset/close'
import commitModifyTest from './PhotoAsset/commitModify'
import getTest from './PhotoAsset/get'
import getReadOnlyFdTest from './PhotoAsset/getReadOnlyFd'
import getThumbnailTest from './PhotoAsset/getThumbnail'
import photoPickerTest from './PhotoAccessHelper/photoPicker'
import PhotoAccessHelperTest from  './PhotoAccessHelperCases/PhotoAccessHelperTest.test.ets'
import setAlbumNameChangeRequestTest from './MediaAlbumChangeRequest/setAlbumName'
import getAlbumChangeRequestTest from './MediaAlbumChangeRequest/getAlbum'
import addRemoveAssetsChangeRequestTest from './MediaAlbumChangeRequest/addRemoveAssets'
import createAssetRequestTest from './MediaAssetChangeRequest/createAssetRequest'
import createImageAssetRequestTest from './MediaAssetChangeRequest/createImageAssetRequest'
import createVideoAssetRequestTest from './MediaAssetChangeRequest/createVideoAssetRequest'
import deleteAssetsChangeRequestTest from './MediaAssetChangeRequest/deleteAssets'
import getAssetChangeRequestTest from './MediaAssetChangeRequest/getAsset'
import setTitleChangeRequestTest from './MediaAssetChangeRequest/setTitle'
import addResourceChangeRequestTest from './MediaAssetChangeRequest/addResource'
import getWriteCacheHandlerTest from './MediaAssetChangeRequest/getWriteCacheHandler'
import requestImageTest from './MediaAssetManager/requestImage'
import requestImageDataTest from './MediaAssetManager/requestImageData'

export default function testsuite () {
  provisionResourcesTest()
  getPhotoAccessHelperTest()
  checkAlbumAttrTest()
  albumGetAssetsTest()
  addAssetsTest()
  albumCommitModifyTest()
  removeAssetsTest()
  albumCloseTest()
  albumGetAllObjectTest()
  albumGetCountTest()
  albumGetFirstObjectTest()
  albumGetLastObjectTest()
  albumGetNextObjectTest()
  albumGetPositionObjectTest()
  albumIsAfterLastTest()
  assetCloseTest()
  assetGetAllObjectTest()
  assetGetCountTest()
  assetGetFirstObjectTest()
  assetGetLastObjectTest()
  assetGetNextObjectTest()
  assetGetPositionObjectTest()
  assetIsAfterLastTest()
  createAssetTest()
  createDeleteRequestTest()
  getAlbumsTest()
  getAssetsTest()
  unRegisterChangeTest()
  registerChangeTest()
  releaseTest()
  checkAttrTest()
  closeTest()
  commitModifyTest()
  getTest()
  getReadOnlyFdTest()
  getThumbnailTest()
  photoPickerTest()
  PhotoAccessHelperTest()
  setAlbumNameChangeRequestTest()
  getAlbumChangeRequestTest()
  addRemoveAssetsChangeRequestTest()
  createAssetRequestTest()
  createImageAssetRequestTest()
  createVideoAssetRequestTest()
  deleteAssetsChangeRequestTest()
  getAssetChangeRequestTest()
  setTitleChangeRequestTest()
  addResourceChangeRequestTest()
  getWriteCacheHandlerTest()
  requestImageTest()
  requestImageDataTest()
}

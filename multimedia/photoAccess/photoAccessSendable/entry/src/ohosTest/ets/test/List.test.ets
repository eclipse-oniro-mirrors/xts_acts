/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import getPhotoAccessHelperTest from './getPhotoAccessHelper.test'
import createAssetTest from './PhotoAccessHelper/createAsset.test'
import getAssetsTest from './PhotoAccessHelper/getAssets.test'
import releaseTest from './PhotoAccessHelper/release.test'
import getBurstAssetsTest from './PhotoAccessHelper/getBurstAssets.test'
import closeTest from './FetchResult/close.test'
import getAllObjectTest from './FetchResult/getAllObjectTest.test'
import getCountTest from './FetchResult/getCount.test'
import getFirstObjectTest from './FetchResult/getFirstObject.test'
import getLastObjectTest from './FetchResult/getLastObject.test'
import getNextObjectTest from './FetchResult/getNextObject.test'
import getObjectByPositionTest from './FetchResult/getObjectByPosition.test'
import IsAfterLastTest from './FetchResult/isAfterLast.test'
import commitModifyTest from './PhotoAsset/commitModify.test'
import convertToPhotoAssetTest from './PhotoAsset/convertToPhotoAsset.test'
import getTest from './PhotoAsset/get.test'
import getThumbnailTest from './PhotoAsset/getThumbnail.test'

export default function testsuite () {
  getPhotoAccessHelperTest()
  createAssetTest()
  getAssetsTest()
  releaseTest()
  getBurstAssetsTest()
  closeTest()
  getAllObjectTest()
  getCountTest()
  getFirstObjectTest()
  getLastObjectTest()
  getNextObjectTest()
  getObjectByPositionTest()
  IsAfterLastTest()
  commitModifyTest()
  convertToPhotoAssetTest()
  getTest()
  getThumbnailTest()
}

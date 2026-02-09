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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, genRandomStr } from '../../common';
import common from '@ohos.app.ability.common';
import { dataSharePredicates } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'setTitle';

async function setTitlePromiseTest(done: Function, testName: string, title: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.info('setTitleDemo');
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOption: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOption);
    let asset = await fetchResult.getFirstObject();
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      new photoAccessHelper.MediaAssetChangeRequest(asset);
    let newTitle: string = title;
    await assetChangeRequest.setTitle(newTitle);
    await phAccessHelper.applyChanges(assetChangeRequest).then(() => {
      console.info('apply setTitle successfully');
    }).catch((err: BusinessError) => {
      console.error(`apply setTitle failed with error: ${err.code}, ${err.message}`);
      expect().assertFail();
    });
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

async function setTitleAbnormalPromiseTest(done: Function, testName: string, title: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.info('setTitleDemo');
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOption: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOption);
    let asset = await fetchResult.getFirstObject();
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      new photoAccessHelper.MediaAssetChangeRequest(asset);
    let newTitle: string = title;
    await assetChangeRequest.setTitle(newTitle);
    await phAccessHelper.applyChanges(assetChangeRequest).then(() => {
      console.info('apply setTitle successfully');
    }).catch((err: BusinessError) => {
      console.error(`apply setTitle failed with error: ${err.code}, ${err.message}`);
      expect().assertFail();
    });
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function MediaAssetChangeRequestSetTitleTest() {
  describe('MediaAssetChangeRequestSetTitleTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
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
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_001
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_001';
      const title = 'newTitle' + genRandomStr(10);
      await setTitlePromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_002
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_002';
      const title = genRandomStr(1);
      await setTitlePromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_003
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_003
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_003';
      const title = genRandomStr(250);
      await setTitlePromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_004
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_004
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_004';
      const title = '我是汉字';
      await setTitlePromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_005
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_005
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_005';
      const title = 'ABC';
      await setTitlePromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_006
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_006
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_006';
      const title = '123456';
      await setTitlePromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_007
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_007
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_007';
      const title = '+-';
      await setTitlePromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_008
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_008
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_008';
      const title = '_abc Abc 123';
      await setTitlePromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_promise_009
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_009  //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_setTitle_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_promise_009';
      const title = genRandomStr(255);
      await setTitlePromiseTest(done, testName, title);
    })*/

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_010 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_001';
      const title = '';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_011 //TODO 可设置多个空格
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_setTitle_Abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_002';
      const title = '  ';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })*/

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_003
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_012 //TODO 可设置多个空格
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_003';
      const title = genRandomStr(256);
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_004
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_013 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_004';
      const title = '1.1';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_005
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_014 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_005';
      const title = '1\\ 1';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_006
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_015 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_006';
      const title = '1/1';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_007
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_016 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_007';
      const title = '1:1';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_008
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_017 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_008';
      const title = '1*1';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_009
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_018 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_009';
      const title = '1?1';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_010
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_019 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_010';
      const title = '1"1';
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_011
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_020 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_011';
      const title = "1'1";
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_012
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_021 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_012';
      const title = "1`1";
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_013
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_022 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_013';
      const title = "1<1";
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_014
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_023 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_014';
      const title = "1>1";
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_015
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_024 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_015';
      const title = "1|1";
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_016
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_025 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_016';
      const title = "1{}1";
      await setTitleAbnormalPromiseTest(done, testName, title);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setTitle_Abnormal_promise_017
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_TITLE_026 //TODO 401
     * @tc.desc   setTitle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setTitle_Abnormal_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setTitle_Abnormal_promise_017';
      const title = "1[]1";
      await setTitleAbnormalPromiseTest(done, testName, title);
    })
  })
}
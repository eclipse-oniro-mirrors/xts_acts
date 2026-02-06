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
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, afterAll } from '@ohos/hypium'
import { createUserAlbum, driveFn, fetchAllOption, getPermission, sleep, genRandomStr } from '../common'
import common from '@ohos.app.ability.common'

export default function ApplyChangesSuppTest() {
  let TAG = 'ApplyChangesSuppTest';
  describe('ApplyChangesSuppTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      AppStorage.setOrCreate<number>('uriList1', 1);
      AppStorage.setOrCreate<string>('uriList2', 'test');
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    afterAll(async () => {
      AppStorage.delete('uriList1');
      AppStorage.delete('uriList2');
    });
    const applyChangesTest =
      async (testName: string, assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest, done: Function,
        callback: (errCode: ESObject) => void) => {
        try {
          console.info(TAG,testName,'Start');
          await helper.applyChanges(assetChangeRequest);
          console.info(TAG, testName, `applyChanges success:`);
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, `applyChanges failed; err:`, JSON.stringify(error), error.code);
          callback(error);
          done();
        }
      }
    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0100
     * @tc.number SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0100
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0100', Level.LEVEL2, async (done: Function) => {
      let testName = 'SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0100';
      await applyChangesTest(testName, null as ESObject, done, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0200
     * @tc.number SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0200
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0200', Level.LEVEL2, async (done: Function) => {
      let testName = 'SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0200';
      await applyChangesTest(testName, undefined as ESObject, done, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0300
     * @tc.number SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0300
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0300', Level.LEVEL2, async (done: Function) => {
      let testName = 'SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0300';
      await applyChangesTest(testName, 0 as ESObject, done, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0400
     * @tc.number SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0400
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0400', Level.LEVEL2, async (done: Function) => {
      let testName = 'SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0400';
      try {
        console.info(TAG,testName,'Start');
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        await helper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, `applyChanges success:`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `applyChanges failed; err:`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0500
     * @tc.number SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0500
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0500', Level.LEVEL2, async (done: Function) => {
      let testName = 'SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0500';
      await applyChangesTest(testName, '' as ESObject, done, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    })

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0600
     * @tc.number SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0600
     * @tc.desc   applyChangesTest by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0600', Level.LEVEL2, async (done: Function) => {
      let testName = 'SUB_PHOTOACCESS_HELPER_APPLYCHANGES_CHANGE_REQUEST_0600';
      try {
        console.info(TAG,testName,'Start');
        let photoType = photoAccessHelper.PhotoType.VIDEO;
        let extension = 'mp4';
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        await helper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, `applyChanges success:`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `applyChanges failed; err:`, JSON.stringify(error), error.code);
        expect(error.code).assertEqual('401');
        done();
      }
    })
  })
}
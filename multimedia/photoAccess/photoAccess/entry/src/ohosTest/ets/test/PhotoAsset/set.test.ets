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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, Level } from "@ohos/hypium";
import {
  sleep,
  getPermission,
  driveFn
} from '../common'
import common from '@ohos.app.ability.common';

export default function setTest() {
  describe('setTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
        console.info('beforeAll case');
        await getPermission();
        await sleep(1000);
        await driveFn();
    });

    const setPhotoAssetTitle = async(done: Function, testNum:string) => {
        console.info('photoAssetSetDemo');
        try {
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          let fetchOption: photoAccessHelper.FetchOptions = {
            fetchColumns: ['title'],
            predicates: predicates
          };
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
          photoAsset.set(title, 'newTitle');
          done();
        } catch (err) {
          console.error(`${testNum} release failed. error: ${err.code}, ${err.message}`);
          expect(false).assertTrue();
          done();
        }
      }

    const setPhotoAssetErrorTitle1 = async(done: Function, testNum:string) => {
        console.info('photoAssetSetDemo');
        try {
            let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
            let fetchOption: photoAccessHelper.FetchOptions = {
                fetchColumns: ['title'],
                predicates: predicates
            };
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            let title: string = '';
            photoAsset.set(title, 'newTitle');
            done();
        } catch (err) {
            console.error(`${testNum} release failed. error: ${err.code}, ${err.message}`);
            expect(err.code === '14000014').assertTrue();
            done();
        }
      }

    const setPhotoAssetErrorTitle2 = async(done: Function, testNum:string) => {
        console.info('photoAssetSetDemo');
        try {
            let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
            let fetchOption: photoAccessHelper.FetchOptions = {
                fetchColumns: ['title'],
                predicates: predicates
            };
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            let title: ESObject = ['123123', '123123'];
            photoAsset.set(title, undefined);
            done();
        } catch (err) {
            console.error(`${testNum} release failed. error: ${err.code}, ${err.message}`);
            expect(err.code === '13900020' || err.code === '401').assertTrue();
            done();
        }
      }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_SET_0000
     * @tc.name      : set_photo_title_000
     * @tc.desc      : set photo title success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('set_photo_title_000', Level.LEVEL0, async (done: Function) => {
        const testNum = 'get_image_uri_000';
        await setPhotoAssetTitle(done, testNum);
        done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0100
     * @tc.name      : set_photo_title_001
     * @tc.desc      : set photo title '', error code 14000014
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('set_photo_title_001', Level.LEVEL2, async (done: Function) => {
        const testNum = 'set_photo_title_001';
        await setPhotoAssetErrorTitle1(done, testNum);
        done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0200
     * @tc.name      : set_photo_title_002
     * @tc.desc      : set photo title ['123123', '123123'], error code 14000014
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('set_photo_title_002', Level.LEVEL2, async (done: Function) => {
        const testNum = 'set_photo_title_002';
        await setPhotoAssetErrorTitle2(done, testNum);
        done();
    });

  });
}
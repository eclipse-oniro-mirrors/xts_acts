/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import Utils from '../Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import { describe, beforeAll, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium/index";
import { fetchOption, checkUserAlbum, checkSystemAlbum, sleep, getPermission, driveFn, pushCreateAsset } from '../Common.test.ets'
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@ohos.base'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function registerPhotoChangeTest () {
  describe('registerPhotoChangeTest', (): void => {
    hilog.info(domain, tag, '%{public}s', 'registerPhotoChangeTest start');

    let appContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(appContext);
    let arr: Array<string> = [photoAccessHelper.PhotoKeys.TITLE, photoAccessHelper.PhotoKeys.HIDDEN];
    let fileNameList: Array<string> = ['registerPhotoChange_01.jpg'];

    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      await pushCreateAsset(appContext, fileNameList);
    });

    const NOTIFY_CHANGE_UPDATE = photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_UPDATE;
    const NOTIFY_CHANGE_YUV_READY = photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_YUV_READY;

    /**
     * @tc.name   register_photoChange_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_REGISTER_PHOTOCHANGE_CALLBACK_001
     * @tc.desc   listening motify file title, type NOTIFY_CHANGE_UPDATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  LEVEL0
     */
    it('register_photoChange_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const testNum = 'register_photoChange_callback_001';
      try {
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('display_name', 'registerPhotoChange_01.jpg');
        const ops : photoAccessHelper.FetchOptions = {
          fetchColumns: arr,
          predicates: predicates
        };
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(ops);
        console.log(`${testNum} :: fetchResult is undefined ? ${fetchResult === undefined}`);
        expect(fetchResult !== undefined).assertTrue();
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        fetchResult.close();
        let count = 0;
        await sleep(550);
        (helper as photoAccessHelper.PhotoAccessHelper).onPhotoChange((changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          (helper as photoAccessHelper.PhotoAccessHelper).offPhotoChange();
          expect(changeData.type).assertEqual(NOTIFY_CHANGE_UPDATE);
        });
        await sleep(550);
        const newTitle = testNum + photoAsset.get(photoAccessHelper.PhotoKeys.TITLE);
        photoAsset.set(photoAccessHelper.PhotoKeys.TITLE, newTitle);
        await photoAsset.commitModify();
        let sleep_time = 0;
        while (sleep_time < 2000) {
          if (count === 1) {
            break;
          }
          await sleep(200);
          sleep_time += 200;
        }
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        hilog.info(domain, tag,
          testNum + ' PhotoAccessHelperTest failed' + ", error.name:" + error.name + ", error.message:" +
          error.message);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
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
import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import Context from "application.Context"
import hilog from '@ohos.hilog'
import { sleep, fetchOption, getFileAsset, photoFetchOption, getPermission, driveFn, } from '../Common.test.ets'
import common from '@ohos.app.ability.common'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function unRegisterChangeTest() {
  describe('unRegisterChangeTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext)
    const DEFAULT_PHOTO_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_PHOTO_URI;
    const DEFAULT_ALBUM_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_ALBUM_URI;

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   unRegisterChange_static_001
     * @tc.number SUB_PHOTOACCESS_UNREGISTERCHANGE_STATIC_0100
     * @tc.desc   unRegister listening motify file title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('unRegisterChange_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'unRegisterChange_static_001';
        try {
          const fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'off01.jpg');
          const asset = await getFileAsset(testNum, fetchOps);
          let count = 0;
          await sleep(550);
          (helper as photoAccessHelper.PhotoAccessHelper).registerChange(asset.uri, false, (changeData) => {
            count++;
            console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          });
          await sleep(550);
          (helper as photoAccessHelper.PhotoAccessHelper).unRegisterChange(asset.uri);
          await sleep(550);
          const newTitle = testNum + asset.get(photoAccessHelper.PhotoKeys.TITLE);
          asset.set(photoAccessHelper.PhotoKeys.TITLE, newTitle);
          await asset.commitModify();
          await sleep(1000);
          expect(count).assertEqual(0);
          done();
        } catch (error) {
          console.log(`${testNum}: tryError: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   unRegisterChange_static_015
     * @tc.number SUB_PHOTOACCESS_UNREGISTERCHANGE_STATIC_1500
     * @tc.desc   unRegister remove all listening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('unRegisterChange_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const testNum = 'unRegisterChange_static_015';
        try {
          let fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'off15.jpg');
          const asset = await getFileAsset(testNum, fetchOps);
          let listenCount = 0;
          await sleep(550);
          (helper as photoAccessHelper.PhotoAccessHelper).registerChange(asset.uri, false, (changeData) => {
            listenCount++;
            console.info(`${testNum} changeData1: ${JSON.stringify(changeData)}`);
          });
          (helper as photoAccessHelper.PhotoAccessHelper).registerChange(asset.uri, false, (changeData) => {
            listenCount++;
            console.info(`${testNum} changeData2: ${JSON.stringify(changeData)}`);
          });
          await sleep(550);
          (helper as photoAccessHelper.PhotoAccessHelper).unRegisterChange(asset.uri);
          await sleep(550);
          const newTitle = testNum + asset.get(photoAccessHelper.PhotoKeys.TITLE);
          asset.set(photoAccessHelper.PhotoKeys.TITLE, newTitle);
          await asset.commitModify();
          await sleep(1000);
          expect(listenCount).assertEqual(0);
          done();
        } catch (error) {
          console.log(`${testNum}: tryError: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   unRegisterChange_static_callback_static_000
     * @tc.number SUB_PHOTOACCESS_UNREGISTERCHANGE_STATIC_CALLBACK_STATIC_0000
     * @tc.desc   unRegister remove specified callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('unRegisterChange_static_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const testNum = 'unRegisterChange_static_callback_static_000';
        try {
          let fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'offCb01.jpg');
          const asset = await getFileAsset(testNum, fetchOps);
          let listenCount1 = 0;
          let listenCount2 = 0;
          await sleep(550);
          const callback1 = (changeData: photoAccessHelper.ChangeData) => {
            listenCount1++;
            hilog.info(domain, tag, `${testNum} callback1: ${JSON.stringify(changeData)}`);
          };
          let callback2: (changeData: photoAccessHelper.ChangeData) => void;
          callback2 = (changeData: photoAccessHelper.ChangeData) => {
            listenCount2++;
            hilog.info(domain, tag, `${testNum} callback2: ${JSON.stringify(changeData)}`);
            (helper as photoAccessHelper.PhotoAccessHelper).unRegisterChange(asset.uri, callback2);
          };
          (helper as photoAccessHelper.PhotoAccessHelper).registerChange(asset.uri, false, callback1);
          (helper as photoAccessHelper.PhotoAccessHelper).registerChange(asset.uri, false, callback2);

          await sleep(550);
          (helper as photoAccessHelper.PhotoAccessHelper).unRegisterChange(asset.uri, callback1);
          await sleep(550);
          const newTitle = testNum + asset.get(photoAccessHelper.PhotoKeys.TITLE);
          asset.set(photoAccessHelper.PhotoKeys.TITLE, newTitle);
          await asset.commitModify();
          await sleep(1000);
          hilog.info(domain, tag, testNum + 'listenCount1 :' + listenCount1);
          hilog.info(domain, tag, testNum + 'listenCount2 :' + listenCount2);
          expect(listenCount1).assertEqual(0);
          expect(listenCount2).assertEqual(1);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${testNum}: tryError: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });
  })
}

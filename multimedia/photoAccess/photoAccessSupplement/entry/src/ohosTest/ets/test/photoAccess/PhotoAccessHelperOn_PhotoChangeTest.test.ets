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
import { getPermission, driveFn} from '../common';
import common from '@ohos.app.ability.common';

const TAG ='PhotoAccessHelperOn_PhotoChangeTestSupp';


export default function PhotoAccessHelperOn_PhotoChangeTest() {
  describe('PhotoAccessHelperOn_PhotoChangeTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('emptyString', '')
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString')
    });

    /**
     * @tc.name   SUB_PHOTO_ON_PHOTO_Change_001
     * @tc.number SUB_PHOTO_ON_PHOTO_Change_001
     * @tc.desc   SUB_PHOTO_ON_PHOTO_Change_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ON_PHOTO_Change_001', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_PHOTO_ON_PHOTO_Change_001";
      try {
        let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          console.info(TAG,testName,'onCallback success, changData: ' + JSON.stringify(changeData));
        }
        phAccessHelper.on(AppStorage.get('emptyString'), onCallback);
        console.info(TAG,testName ,'空字符串已处理，未发生错误');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG,testName,'空字符串处理失败, 错误信息: ', error,error.code);
        expect(error.code).assertEqual("23800151")
        done();
      }
    });

      /**
       * @tc.name   SUB_PHOTO_ON_PHOTO_Change_002
       * @tc.number SUB_PHOTO_ON_PHOTO_Change_002
       * @tc.desc   第一个参数为undefined的情况
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_PHOTO_ON_PHOTO_Change_002', Level.LEVEL0, async (done: Function) => {
        const testName = "SUB_PHOTO_ON_PHOTO_Change_002";

        try {
          let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
            console.info(TAG,testName,'onCallback success, changData: ' + JSON.stringify(changeData ));
          }
          phAccessHelper.on(undefined, onCallback);
          console.info(TAG,testName, 'undefined参数已处理，未发生错误');
          expect().assertFail()
          done();
        } catch (error) {
          console.error(TAG,testName,'undefined参数处理失败, 错误信息: ', error,error.code);
          expect(error.code).assertEqual("401")

          done();
        }
      });
    /**
     * @tc.name   SUB_PHOTO_ON_PHOTO_Change_003
     * @tc.number SUB_PHOTO_ON_PHOTO_Change_003
     * @tc.desc   第一个参数为null的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ON_PHOTO_Change_003', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_PHOTO_ON_PHOTO_Change_003";

      try {
        let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          console.info(TAG,testName,'onCallback success, changData: ' + JSON.stringify(changeData ));
        }
        phAccessHelper.on(null, onCallback);
        console.info(TAG,testName, 'null参数已处理，未发生错误');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG,testName,'null参数处理失败, 错误信息: ', error,error.code);
        expect(error.code).assertEqual("401")
        done();
      }
    });
    });
}

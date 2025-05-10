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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { driveFn, genRadomStr, getPermission, photoType, sleep } from '../common';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function createDeleteRequestTest() {
  describe('createDeleteRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    const ERR_CODE_PARAMERTER_INVALID = 13900020;
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    const createFiles = async (count: number) => {
      const uriList: Array<string> = new Array();
      try {
        for (let i = 0; i < count; i++) {
          let title: string = genRadomStr(10);
          let asset = await helper.createAsset(title + '.jpg');
          let fd: number = await asset.open('rw');
          await asset.close(fd);
          uriList.push(asset.uri);
        }
        return uriList;
      } catch (error) {
        console.info(`delete_popup createFiles error ${error}`);
        return uriList;
      }
    };
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_DELETE_REQUEST_0000
     * @tc.name      : createDeleteRequest_callback_000
     * @tc.desc      : delete 1 file
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createDeleteRequest_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createDeleteRequest_callback_000';
      try {
        let uriList = await createFiles(1);
        console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`);
        helper.createDeleteRequest(uriList, (err) => {
          try {
            if (err) {
              console.info(`${testNum} error ${JSON.stringify(err)}`);
            } else {
              console.log(`${testNum} delete suc`);
            }
          } catch (error) {
            console.info(`${testNum} error ${JSON.stringify(error)}`);
          }
          done();
        });
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_CREATE_DELETE_REQUEST_0100
     * @tc.name      : createDeleteRequest_callback_001
     * @tc.desc      : createFiles 0 file,error code is 13900020 or 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createDeleteRequest_callback_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createDeleteRequest_callback_001';
      try {
        let uriList = await createFiles(0);
        console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`);
        helper.createDeleteRequest(uriList, (err) => {
          expect(false).assertTrue();
        });
        done();
      } catch (error) {
        console.log(`${testNum} success, error code : ${error.code}`)
        expect(error.code === 13900020 || error.code === 401).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_DELETE_REQUEST_0000
     * @tc.name      : createDeleteRequest_promise_000
     * @tc.desc      : delete 1 file
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createDeleteRequest_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createDeleteRequest_promise_000';
      try {
        let uriList = await createFiles(1);
        helper.createDeleteRequest(uriList)
          .then(() => {
            console.log(`${testNum} delete suc`);
          })
          .catch((error:BusinessError ) => {
            console.info(`${testNum} error ${JSON.stringify(error)}`);
            expect(true).assertTrue();
          });
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_CREATE_DELETE_REQUEST_0100
     * @tc.name      : createDeleteRequest_promise_001
     * @tc.desc      : createFiles 0 file,error code is 13900020 or 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('createDeleteRequest_promise_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createDeleteRequest_promise_001';
      try {
        let uriList = await createFiles(0);
        console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`);
        helper.createDeleteRequest(uriList);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log(`${testNum} success, error code : ${error.code}`)
        expect(error.code === 13900020 || error.code === 401).assertTrue();
        done();
      }
    });
  });
}

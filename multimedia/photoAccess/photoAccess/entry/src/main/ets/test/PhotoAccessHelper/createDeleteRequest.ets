/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, it, expect } from 'deccjsunit/index'
import { genRadomStr, photoType } from '../../../../../../../common';

export default function createDeleteRequestTest() {
  describe('createDeleteRequestTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    const ERR_CODE_PARAMERTER_INVALID = 13900020;

    const createFiles = async (count) => {
      try {
        const uriList: Array<string> = new Array();
        for (let i = 0; i < count; i++) {
          let title = genRadomStr(10);
          let asset = await helper.createAsset(title + '.jpg');
          let fd = await asset.open('rw');
          await asset.close(fd);
          uriList.push(asset.uri);
        }
        return uriList;
      } catch (error) {
        console.info(`delete_popup createFiles error ${error}`);
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
    it('createDeleteRequest_callback_000', 0, async function (done) {
      const testNum = 'createDeleteRequest_callback_000';
      try {
        let uriList = await createFiles(1);
        console.info(`${testNum} uriList: ${JSON.stringify(uriList)}`)
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
        })
        done();
      } catch (error) {
        expect(false).assertTrue();
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
    it('createDeleteRequest_promise_000', 0, async function (done) {
      const testNum = 'createDeleteRequest_promise_000';
      try {
        let uriList = await createFiles(1);
        helper.createDeleteRequest(uriList)
          .then(() => {
            console.log(`${testNum} delete suc`);
          })
          .catch((error) => {
            console.info(`${testNum} error ${JSON.stringify(error)}`);
            expect(true).assertTrue();
          });
        done();
      } catch (error) {
        expect(false).assertTrue();
        done();
      }
    });
  });
}

/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundle from '@ohos.bundle.bundleManager';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

const BUNDLE_PATH = "/data/storage/el1/bundle/abcs";
const ABC_PATH = "/data/storage/el2/base/haps/entry/files/testAbc.abc";

export default function VerifyAbcTest() {
  describe('VerifyAbcTest', function () {
    /*
     * @tc.number: Sub_Bms_Framework_verifyAbc_0100
     * @tc.name: verifyAbc
     * @tc.desc: Test verifyAbc with default flag(by promise).
     */
    it('verifyAbc_0100', 0, async function (done) {
      let paths : Array<string> = [ABC_PATH]
      console.info("verifyAbc_0100 start");
      await bundle.verifyAbc(paths, false).then(data => {
        if (data == null || data === undefined) {
          console.info("verifyAbc_0100 is undefined");
        } else {
          console.info("verifyAbc_0100" + JSON.stringify(data));
        }
        expect(data).assertEqual(undefined);
        fs.access(BUNDLE_PATH + ABC_PATH).then((res : boolean) => {
          expect(res).assertEqual(true);
          bundle.deleteAbc(ABC_PATH).then(res => {
            fs.access(BUNDLE_PATH + ABC_PATH).then((res : boolean) => {
              expect(res).assertEqual(false);
            }).catch((err) => {
              console.info("verifyAbc_0100 deleteAbc access failed" + JSON.stringify(err));
              expect(err).assertFail();
              done();
            });
          }).catch((err) => {
            console.info("verifyAbc_0100 deleteAbc failed" + JSON.stringify(err));
            expect(err).assertFail();
            done();
          });
        }).catch((err) => {
          console.info("verifyAbc_0100 fs access" + JSON.stringify(err));
          expect(err).assertFail();
          done();
        });
        done();
      }).catch(err => {
        console.info("verifyAbc_0100 fail" + JSON.stringify(err));
        expect(err).assertFail();
        done();
      })
    })

    /*
     * @tc.number: Sub_Bms_Framework_verifyAbc_0200
     * @tc.name: verifyAbc
     * @tc.desc: Test verifyAbc with default flag(by promise).
     */
    it('verifyAbc_0200', 0, async function (done) {
      let paths : Array<string> = ['/data/storage/el2/base/haps/entry/files/bad.abc']
      console.info("verifyAbc_0200 start");
      await bundle.verifyAbc(paths, false).then(data => {
        if (data == null || data === undefined) {
          console.info("verifyAbc_0200 is null");
        } else {
          console.info("verifyAbc_0200" + JSON.stringify(data));
        }
        expect(data).assertEqual(null);
        done();
      }).catch(err => {
        console.info("verifyAbc_0200 fail, code: " + err.code + ", msg: " + err.message);
        expect(err.code).assertEqual(17700201);
        done();
      })
    })
  })
}

/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import defaultAppMgr from '@ohos.bundle.defaultAppManager'

export default function isDefaultApplicationTest() {
    describe('isDefaultApplicationTest', function() {
  
       /**
         * @tc.number: isDefaultApplication_0100
         * @tc.name: isDefaultApplication Promise and Callback
         * @tc.desc: No default image application is set. Query and return false
         */
          it('isDefaultApplication_0100', 0, async function (done) {
              const data = await defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE)
              console.info("isDefaultApplication_0100 --- " + data)
              expect(data).assertFalse()
              defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE,(err,data) => {
                  console.info("isDefaultApplication_0100 data--- " + data)
                  console.info("isDefaultApplication_0100 err--- " + err)
                  expect(data).assertFalse()
                  expect(err).assertEqual(null)
                  done()
              })
          });

       /**
         * @tc.number: isDefaultApplication_0200
         * @tc.name: isDefaultApplication Promise
         * @tc.desc: The parameter type is correct, the string format is incorrect, return false
         */
        it('isDefaultApplication_0200', 0, async function (done) {
            const data = await defaultAppMgr.isDefaultApplication("image/")
            console.info("isDefaultApplication_0200 --- " + data)
            expect(data).assertFalse()
            done();
        });

       /**
         * @tc.number: isDefaultApplication_0300
         * @tc.name: isDefaultApplication Promise
         * @tc.desc: The parameter type is correct, the string format is incorrect, return false
         */
        it('isDefaultApplication_0300', 0, async function (done) {
            const data = await defaultAppMgr.isDefaultApplication("abc")
            console.info("isDefaultApplication_0300 --- " + data)
            expect(data).assertFalse()
            done()
        });

        /**
         * @tc.number: applicationType_0100
         * @tc.name: test ApplicationType
         * @tc.desc: ApplicationType is string
         */
        it('applicationType_0100', 0, async function (done) {
            expect(typeof (defaultAppMgr.ApplicationType.BROWSER)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.BROWSER).assertEqual("Web Browser");

            expect(typeof (defaultAppMgr.ApplicationType.IMAGE)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.IMAGE).assertEqual("Image Gallery");

            expect(typeof (defaultAppMgr.ApplicationType.AUDIO)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.AUDIO).assertEqual("Audio Player");

            expect(typeof (defaultAppMgr.ApplicationType.VIDEO)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.VIDEO).assertEqual("Video Player");

            expect(typeof (defaultAppMgr.ApplicationType.PDF)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.PDF).assertEqual("PDF Viewer");

            expect(typeof (defaultAppMgr.ApplicationType.WORD)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.WORD).assertEqual("Word Viewer");

            expect(typeof (defaultAppMgr.ApplicationType.EXCEL)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.EXCEL).assertEqual("Excel Viewer");

            expect(typeof (defaultAppMgr.ApplicationType.PPT)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.PPT).assertEqual("PPT Viewer");
            done()
        });
    })
  }
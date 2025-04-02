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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import defaultAppMgr from '@ohos.bundle.defaultAppManager'

const PARAM_ERROR_CODE = 401;

export default function isDefaultApplicationTest() {
    describe('isDefaultApplicationTest', function() {
  
       /**
         * @tc.number: Sub_Bms_Framework_Status_DefaultApp_0900
         * @tc.name: isDefaultApplication Promise and Callback
         * @tc.desc: No default image application is set. Query and return false
         */
          it('Sub_Bms_Framework_Status_DefaultApp_0900', 0, async function (done) {
              const data = await defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE)
              console.info("Sub_Bms_Framework_Status_DefaultApp_0900 --- " + data)
              expect(data).assertFalse()
              defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE,(err,data) => {
                  console.info("Sub_Bms_Framework_Status_DefaultApp_0900 data--- " + data)
                  console.info("Sub_Bms_Framework_Status_DefaultApp_0900 err--- " + err)
                  expect(data).assertFalse()
                  expect(err).assertEqual(null)
                  done()
              })
          });

       /**
         * @tc.number: Sub_Bms_Framework_Status_DefaultApp_0650
         * @tc.name: isDefaultApplication Promise
         * @tc.desc: The parameter type is correct, the string format is incorrect, return false
         */
        it('Sub_Bms_Framework_Status_DefaultApp_0650', 0, async function (done) {
            const data = await defaultAppMgr.isDefaultApplication("image/")
            console.info("Sub_Bms_Framework_Status_DefaultApp_0650 --- " + data)
            expect(data).assertFalse()
            done();
        });

       /**
         * @tc.number: Sub_Bms_Framework_Status_DefaultApp_1150
         * @tc.name: isDefaultApplication Promise
         * @tc.desc: The parameter type is correct, the string format is incorrect, return false
         */
        it('Sub_Bms_Framework_Status_DefaultApp_1150', 0, async function (done) {
            const data = await defaultAppMgr.isDefaultApplication("abc")
            console.info("Sub_Bms_Framework_Status_DefaultApp_1150 --- " + data)
            expect(data).assertFalse()
            done()
        });

        /**
         * @tc.number: Sub_Bms_Framework_Status_DefaultApp_1200
         * @tc.name: test ApplicationType
         * @tc.desc: ApplicationType is string
         */
        it('Sub_Bms_Framework_Status_DefaultApp_1200', 0, async function (done) {
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

            expect(typeof (defaultAppMgr.ApplicationType.EMAIL)).assertEqual("string");
            expect(defaultAppMgr.ApplicationType.EMAIL).assertEqual("Email");
            done()
        });


        /**
          * @tc.number: Sub_Bms_Framework_Status_DefaultApp_2550
          * @tc.name: testIsDefaultApplicationNotExistedType
          * @tc.desc: The parameter type is correct, the string format is incorrect, return false
          */
        it('testIsDefaultApplicationNotExistedType', 0, async function (done) {
            try {
                let data = defaultAppMgr.isDefaultApplicationSync("abc");
                expect(data).assertFalse();
                done();
            } catch (err) {
                expect().assertFail();
                done();
            }
        });

        /**
          * @tc.number: SUB_BMS_DEFAULTAPP_QUERY_0053
          * @tc.name: testIsDefaultApplicationNullType
          * @tc.desc: The parameter type is null, the string format is incorrect, return false
          */
        it('testIsDefaultApplicationNullType', 0, async function (done) {
            try {
                let data = defaultAppMgr.isDefaultApplicationSync(null);
                expect(data).assertFail();
                done();
            } catch (err) {
                expect(err.code).assertEqual(PARAM_ERROR_CODE);
                done();
            }
        });

        /**
          * @tc.number: SUB_BMS_DEFAULTAPP_QUERY_0053
          * @tc.name: testIsDefaultApplicationUndefinedType
          * @tc.desc: The parameter type is undefined, the string format is incorrect, return false
          */
        it('testIsDefaultApplicationUndefinedType', 0, async function (done) {

            try {
                let data = defaultAppMgr.isDefaultApplicationSync(undefined);
                expect(data).assertFail();
                done();
            } catch (err) {
                expect(err.code).assertEqual(PARAM_ERROR_CODE);
                done();
            }
        });
    })
  }
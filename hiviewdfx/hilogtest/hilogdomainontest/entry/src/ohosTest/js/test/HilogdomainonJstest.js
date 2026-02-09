/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import hilog from '@ohos.hilog'

export default function HilogdomainonJstest() {
describe('HilogdomainonJstest', function () {

    /**
    * run before testClass
    */
    beforeAll(function () {
        console.info('beforeAll called');
    })

    /**
    * run after testClass
    */
    afterAll(function () {
        console.info('afterAll called');
    })

    /**
     * @tc.name   testHilogJsApi05
     * @tc.number DFX_DFT_Hilog_Domain_White_0500
     * @tc.desc   The log tool can read valid app log types when domain on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi01 start');
        try{
            hilog.error(0xffff, "HILOGTEST", "%{public}s", ['hilogJs0100'])
        } catch (error){
            console.log(`testHilogJsApi05 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi05 end');
    })

    /**
     * @tc.name   testHilogJsApi06
     * @tc.number DFX_DFT_Hilog_Domain_White_0600
     * @tc.desc   The log tool can't read white app log types when domain on.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHilogJsApi06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        console.info('testHilogJsApi02 start');
        try{
            hilog.error(0xD003200, "HILOGTEST", "%{public}s", ['hilogJs0200'])
        } catch (error){
            console.log(`testHilogJsApi06 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi06 end');
    })
})
}
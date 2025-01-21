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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import hilog from '@ohos.hilog'

export default function HilogdomainoffJsTest() {
describe('HilogdomainoffJsTest', function () {

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
     * @tc.number DFX_DFT_Hilog_Domain_White_0700
     * @tc.name 验证关闭domain白名单，type为LOG_APP,domain id有效，日志正常打印
     * @tc.desc The log tool can read valid app log types when domain off.
     */
    it('testHilogJsApi07', 2, function () {
        console.info('testHilogJsApi01 start');
        try{
            hilog.error(0xffff, "HILOGTEST", "%{public}s", ['hilogJs0100'])
        } catch (error){
            console.log(`testHilogJsApi07 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi07 end');
    })

    /**
     * @tc.number DFX_DFT_Hilog_Domain_White_0800
     * @tc.name 验证关闭domain白名单，type为LOG_APP,domain id无效（在白名单内)，日志正常打印
     * @tc.desc The log tool can read white app log types when domain off.
     */
    it('testHilogJsApi08', 2, function () {
        console.info('testHilogJsApi08 start');
        try{
            hilog.error(0xD003200, "HILOGTEST", "%{public}s", ['hilogJs0200'])
        } catch (error){
            console.log(`testHilogJsApi08 got an error: ${JSON.stringify(error)}`)
            expect().assertFail()
        }
        console.info('testHilogJsApi08 end');
    })
})
}
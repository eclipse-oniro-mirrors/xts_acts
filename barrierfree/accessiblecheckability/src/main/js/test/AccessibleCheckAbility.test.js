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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import accessibility from '@ohos.accessibility'

export default function AccessibleCheckAbility() {
describe('AccessibleCheckAbility', function () {
    const TIMEOUT = 1000;

    beforeEach(async function (done) {
        console.info(`AccessibleAbilityList: beforeEach starts`);
        done();
    })

    afterEach(async function (done) {
        console.info(`AccessibleAbilityList: afterEach starts`);
        done();
    })

 
    /******************************************************************************************* */
    /* Cases SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0300-0400 are for accessibility.isOpenTouchGuide() API test   */
    /******************************************************************************************* */

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0300
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0300
     * @tc.desc   Test isOpenTouchGuide() function in callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0300', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0300');
        accessibility.isOpenTouchGuide((err, data) => {
            if (err && err.code != 0) {
                console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0300 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            expect(typeof (data)).assertEqual('boolean');
            done();
        });
    })
  
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0400
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0400
     * @tc.desc   Test isOpenTouchGuide() function in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0400', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0400');
        accessibility.isOpenTouchGuide().then((result) => {
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0400 result: ${result}`);
            expect(typeof (result)).assertEqual('boolean');
            done();
        }).catch((err) => {
            if (err && err.code != 0){
                console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0400 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
        });
    })
  
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0600
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0600
     * @tc.desc   The result of isOpenTouchGuideSync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0600', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0600');
        try {
            let status = accessibility.isOpenTouchGuideSync();
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0600 result: ${status}`);
            expect(typeof (status)).assertEqual('boolean');
            done();
        } catch (exception) {
            console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0600 failed to isOpenTouchGuideSync because ' + JSON.stringify(exception));
        }
    })
	
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0700
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0700
     * @tc.desc   The result of isScreenReaderOpenSync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0700', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0700');
        try {
            let status = accessibility.isScreenReaderOpenSync();
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0700 result: ${status}`);
            expect(status).assertEqual(false);
            done();
        } catch (exception) {
            console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0700 failed to isScreenReaderOpenSync because ' + JSON.stringify(exception));
        }
    })
	
})

}

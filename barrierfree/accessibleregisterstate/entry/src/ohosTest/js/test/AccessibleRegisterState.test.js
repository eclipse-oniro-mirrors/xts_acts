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
import accessibility from '@ohos.accessibility'
import { Driver } from '@ohos.UiTest';

const bundleName = 'com.sample.testfora11y';
const triggerAction = 'accessibilityFocus';
const eventType = 'accessibilityFocus';

export default function AccessibleRegisterState() {
describe('AccessibleRegisterState', function () {
    beforeAll(async function (done) {
        let driver = Driver.create();
        console.info(`AccessibleRegisterState: beforeAll starts`);
        done();
    })

    beforeEach(async function (done) {
        console.info(`AccessibleRegisterState: beforeEach starts`);
        done();
    })

    afterEach(async function (done) {
        console.info(`AccessibleRegisterState: afterEach starts`);
        done();
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0100
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0100
    * @tc.desc    on(accessibilityStateChange)
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0100', 0, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0100');
      let callbackdata = (data) => {
      }
      accessibility.on('accessibilityStateChange', callbackdata);
      accessibility.off('accessibilityStateChange', callbackdata);
      expect(true).assertTrue();
      done();
    })

    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0200
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0200
    * @tc.desc    on(touchGuideStateChange)
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0200', 0, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0200');
      let callbackdata = (data) => {
      }
      accessibility.on('touchGuideStateChange', callbackdata);
      accessibility.off('touchGuideStateChange', callbackdata);
      expect(true).assertTrue();
      done();
    })
    
    /*
    * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0300
    * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0300
    * @tc.desc    on(screenReaderStateChange)
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0300', 0, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0300');
      let callbackdata = (data) => {
      }
      accessibility.on('screenReaderStateChange', callbackdata);
      accessibility.off('screenReaderStateChange', callbackdata);
      expect(true).assertTrue();
      done();
    })
})
}

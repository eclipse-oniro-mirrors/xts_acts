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
    /* Cases SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0100-0200 are for accessibility.isOpenAccessibility() API test   */
    /******************************************************************************************* */

    /* Cases for namespace accessibility */
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0100
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0100
     * @tc.desc   Test isOpenAccessibility() function in callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0100', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0100');
        accessibility.isOpenAccessibility((err, data) => {
            if (err && err.code != 0) {
                console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0100 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            expect(typeof (data)).assertEqual('boolean');
            done();
        });
      })
  
    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0200
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0200
     * @tc.desc   Test isOpenAccessibility() function in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0200', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0200');
        accessibility.isOpenAccessibility().then((result) => {
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0200 result: ${result}`);
            expect(typeof (result)).assertEqual('boolean');
            done();
        }).catch((err) => {
            console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0200 has error: ${err.code}`);
            expect(null).assertFail();
            done();
        });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0500
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0500
     * @tc.desc   The result of isOpenAccessibilitySync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0500', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0500');
        try {
            let status = accessibility.isOpenAccessibilitySync();
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0500 result: ${status}`);
            expect(typeof (status)).assertEqual('boolean');
            done();
        } catch (exception) {
            console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0500 failed to isOpenAccessibilitySync because ' + JSON.stringify(exception));
            expect(null).assertFail();
            done();
        }
      })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0800
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0800
     * @tc.desc   The result of getTouchModeSync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0800', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0800');
        try {
            let status = accessibility.getTouchModeSync();
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0800 result: ${status}`);
            expect(typeof (status)).assertEqual('string');
            done();
        } catch (exception) {
            console.error('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_0800 failed to getTouchModeSync because ' + JSON.stringify(exception));
        }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0300
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0300
     * @tc.desc   Test isAnimationReduceEnabled() function in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0300', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0300');

        accessibility.isAnimationReduceEnabled().then((result) => {
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0300 result: ${result}`);
            expect(typeof (result)).assertEqual('boolean');
            done();
        }).catch((err) => {
            console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0300 has error: ${err.code}`);
            expect(null).assertFail();
            done();
        });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0500
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0500
     * @tc.desc   The result of isAnimationReduceEnabledSync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0500', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0500');
        try {
            let status = accessibility.isAnimationReduceEnabledSync();
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0500 result: ${status}`);
            expect(typeof (status)).assertEqual('boolean');
            done();
        } catch (exception) {
            console.error('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0500 failed to isAnimationReduceEnabledSync because ' + JSON.stringify(exception));
        }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0300
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0300
     * @tc.desc   Test isAudioMonoEnabled() function in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0300', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0300');

        accessibility.isAudioMonoEnabled().then((result) => {
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0300 result: ${result}`);
            expect(typeof (result)).assertEqual('boolean');
            done();
        }).catch((err) => {
            console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0300 has error: ${err.code}`);
            expect(null).assertFail();
            done();
        });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0500
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0500
     * @tc.desc   The result of isAudioMonoEnabledSync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0500', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0500');
        try {
            let status = accessibility.isAudioMonoEnabledSync();
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0500 result: ${status}`);
            expect(typeof (status)).assertEqual('boolean');
            done();
        } catch (exception) {
            console.error('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0500 failed to isAudioMonoEnabledSync because ' + JSON.stringify(exception));
        }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0300
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0300
     * @tc.desc   Test isFlashReminderEnabled() function in promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0300', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0300');

        accessibility.isFlashReminderEnabled().then((result) => {
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0300 result: ${result}`);
            expect(typeof (result)).assertEqual('boolean');
            done();
        }).catch((err) => {
            console.error(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0300 has error: ${err.code}`);
            expect(null).assertFail();
            done();
        });
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0500
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0500
     * @tc.desc   The result of isFlashReminderEnabledSync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0500', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0500');
        try {
            let status = accessibility.isFlashReminderEnabledSync();
            console.info(`AccessibilityApi: SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0500 result: ${status}`);
            expect(typeof (status)).assertEqual('boolean');
            done();
        } catch (exception) {
            console.error('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0500 failed to isFlashReminderEnabledSync because ' + JSON.stringify(exception));
        }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0300
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0300
     * @tc.desc   on(screenReaderStateChange)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0300', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0300');
      let callbackdata = (data) => {
      }
      accessibility.on('screenReaderStateChange', callbackdata);
      accessibility.off('screenReaderStateChange', callbackdata);
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0400
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0400
     * @tc.desc   on(touchModeChange)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0400', TestType.FUNCTION | Size.SmallTest| Level.LEVEL1, async function (done) {
        console.info('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0400');
        let callbackdata = (data) => {
        }
        accessibility.on('touchModeChange', callbackdata);
        accessibility.off('touchModeChange', callbackdata);
        expect(true).assertTrue();
        done();
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0100
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0100
     * @tc.desc   onAnimationReduceStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0100', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0100');
      let callbackdata = (data) => {
        console.info(domain, tag, 'on animationReduce state changed');
      }

      try {
        accessibility.onAnimationReduceStateChange(callbackdata);
        accessibility.offAnimationReduceStateChange(callbackdata);
        accessibility.offAnimationReduceStateChange();
        expect(true).assertTrue();
        done();
      } catch (error) {
        hilog.error(domain, tag, ` SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAnimationReduce_0100 failed. code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0100
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0100
     * @tc.desc   onAudioMonoStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0100', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0100');
      let callbackdata = (data) => {
        console.info(domain, tag, 'on AudioMono state changed');
      }
      try {
        accessibility.onAudioMonoStateChange(callbackdata);
        accessibility.offAudioMonoStateChange(callbackdata);
        accessibility.offAudioMonoStateChange();
        expect(true).assertTrue();
        done();
      } catch (error) {
        hilog.error(domain, tag, ` SUB_BASIC_BARRIERFREE_Accessibility_InquiriesAudioMono_0100 failed. code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0100
     * @tc.number SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0100
     * @tc.desc   onFlashReminderStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0100', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0100');
      let callbackdata = (data) => {
        console.info(domain, tag, 'on flashReminder state changed');
      }
      try {
        accessibility.onFlashReminderStateChange(callbackdata);
        accessibility.offFlashReminderStateChange(callbackdata);
        accessibility.offFlashReminderStateChange();
        expect(true).assertTrue();
        done();
      } catch (error) {
        hilog.error(domain, tag, ` SUB_BASIC_BARRIERFREE_Accessibility_InquiriesFlashReminder_0100 failed. code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0100
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0100
     * @tc.desc   on(accessibilityStateChange)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0100', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
      console.info('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_0100');
      let callbackdata = (data) => {
      }
      accessibility.on('accessibilityStateChange', callbackdata);
      accessibility.off('accessibilityStateChange', callbackdata);
      expect(true).assertTrue();
      done();
    })
	
})

}

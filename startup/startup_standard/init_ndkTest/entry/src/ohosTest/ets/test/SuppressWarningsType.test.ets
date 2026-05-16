import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { SuppressWarningsType } from '@ohos.annotation';

export default function SuppressWarningsTypeTest() {
    describe('SuppressWarningsTypeTest', () => {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(() => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(() => {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })

/**
          * @tc.number SUB_SDK_GONGJULIAN_SUPRESSWARNINGTYPE_0100
          * @tc.name SuppressWarningsType_test_001
          * @tc.desc Verify the accuracy of COMPATIBILITY enum value, must be strictly equal to 'compatibility'
          * @tc.size MediumTest
          * @tc.type Function
          * @tc.level Level 3
          */
        it('SuppressWarningsType_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            expect(SuppressWarningsType.COMPATIBILITY).assertEqual('compatibility');
            expect(typeof SuppressWarningsType.COMPATIBILITY).assertEqual('string');
        });
/**
          * @tc.number SUB_SDK_GONGJULIAN_SUPRESSWARNINGTYPE_0200
          * @tc.name SuppressWarningsType_test_002
          * @tc.desc Verify the accuracy of SYSCAP enum value, must be strictly equal to 'syscap'
          * @tc.size MediumTest
          * @tc.type Function
          * @tc.level Level 3
          */
        it('SuppressWarningsType_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            expect(SuppressWarningsType.SYSCAP).assertEqual('syscap');
            expect(typeof SuppressWarningsType.COMPATIBILITY).assertEqual('string');
        });
        /**
         * @tc.number SUB_SDK_GONGJULIAN_SUPRESSWARNINGTYPE_0300
         * @tc.name SuppressWarningsType_test_003
         * @tc.desc Verify the accuracy of PERMISSION enum value, must be strictly equal to 'permission'
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('SuppressWarningsType_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            expect(SuppressWarningsType.PERMISSION).assertEqual('permission');
            expect(typeof SuppressWarningsType.PERMISSION).assertEqual('string');
        });

    });
}
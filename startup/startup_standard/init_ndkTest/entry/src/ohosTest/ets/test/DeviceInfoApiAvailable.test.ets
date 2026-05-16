import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import deviceInfo from '@ohos.deviceInfo';

export default function DeviceInfoApiAvailableTest() {
    describe('DeviceInfoApiAvailableTest', () => {
        beforeAll(() => {
        })
        beforeEach(() => {
        })
        afterEach(() => {
        })
        afterAll(() => {
        })

        /**
         * @tc.number SUB_SDK_GONGJULIAN_DEVICEINFO_0100
         * @tc.name DeviceInfoApiAvailable_test_001
         * @tc.desc Verify apiAvailable can be called with string version and returns boolean.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('DeviceInfoApiAvailable_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            let result: boolean = deviceInfo.apiAvailable('26.0.0');
            console.info('apiAvailable string version result: ' + result);
            expect(typeof result).assertEqual('boolean');
        });

        /**
         * @tc.number SUB_SDK_GONGJULIAN_DEVICEINFO_0200
         * @tc.name DeviceInfoApiAvailable_test_002
         * @tc.desc Verify apiAvailable can be called with number version and returns boolean.
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 3
         */
        it('DeviceInfoApiAvailable_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
            let result: boolean = deviceInfo.apiAvailable(13);
            console.info('apiAvailable number version result: ' + result);
            expect(typeof result).assertEqual('boolean');
        });
    });
}

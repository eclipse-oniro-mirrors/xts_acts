/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import commoneventerror from 'libcommoneventerrorcode.so'
const Success = 0;

export default function ActsCommonEventErrorTest() {
  describe('ActsCommonEventErrorTest', () => {
    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_InvalidParameter_0100
     * @tc.name    : Sub_Notification_Ces_CommonEvent_InvalidParameter_0100
     * @tc.desc    : Test testCommonEventInvalidParameter
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_InvalidParameter_0100', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_InvalidParameter_0100 start====");
        let result: number = commoneventerror.testCommonEventInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_InvalidParameter_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_InvalidParameter_0100 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublisherPermissionSuccess_0200
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublisherPermissionSuccess_0200
     * @tc.desc    : Test SetPublisherPermissionSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublisherPermissionSuccess_0200', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_SetPublisherPermissionSuccess_0200 start====");
        let result: number = commoneventerror.SetPublisherPermissionSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_SetPublisherPermissionSuccess_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_SetPublisherPermissionSuccess_0200 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublisherPermissionError_0300
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublisherPermissionError_0300
     * @tc.desc    : Test SetPublisherPermissionError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublisherPermissionError_0300', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_SetPublisherPermissionError_0300 start====");
        let result: number = commoneventerror.SetPublisherPermissionError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_SetPublisherPermissionError_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_SetPublisherPermissionError_0300 catch err: " + err);
        expect().assertFail();

      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameSuccess_0400
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameSuccess_0400
     * @tc.desc    : Test SetPublisherBundleNameSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameSuccess_0400', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameSuccess_0400 start====");
        let result: number = commoneventerror.SetPublisherBundleNameSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameSuccess_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameSuccess_0400 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameError_0500
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameError_0500
     * @tc.desc    : Test SetPublisherBundleNameError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameError_0500', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameError_0500 start====");
        let result = commoneventerror.SetPublisherBundleNameError();
        console.info("====>Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameError_0500 result: " + result);
        expect(result).assertEqual(Success);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_SetPublisherBundleNameError_0500 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_InvalidParameter_0600
     * @tc.name    : Sub_Notification_Ces_CommonEvent_InvalidParameter_0600
     * @tc.desc    : Test SetPublishInfoBundleNameInvalidParameter
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_InvalidParameter_0600', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoBundleName start====");
        let result = commoneventerror.SetPublishInfoBundleNameInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoBundleName result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoBundleName catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissionSuccess_0700
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissionSuccess_0700
     * @tc.desc    : Test SetPublishInfoPermissionSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissionSuccess_0700', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoPermissionSuccess start====");
        let result: number = commoneventerror.SetPublishInfoPermissionSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoPermissionSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoPermissionSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissionError_0800
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissionError_0800
     * @tc.desc    : Test SetPublishInfoPermissionError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoPermissionError_0800', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoPermissionError start====");
        let result: number = commoneventerror.SetPublishInfoPermissionError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoPermissionError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoPermissionError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublishInfoCodeSuccess_0900
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublishInfoCodeSuccess_0900
     * @tc.desc    : Test SetPublishInfoCodeSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoCodeSuccess_0900', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoCodeSuccess start====");
        let result: number = commoneventerror.SetPublishInfoCodeSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoCodeSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoCodeSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublishInfoCodeError_1000
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublishInfoCodeError_1000
     * @tc.desc    : Test SetPublishInfoCodeError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoCodeError_1000', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoCodeError start====");
        let result: number = commoneventerror.SetPublishInfoCodeError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoCodeError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoCodeError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublishInfoDataSuccess_1100
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublishInfoDataSuccess_1100
     * @tc.desc    : Test SetPublishInfoDataSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoDataSuccess_1100', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoDataSuccess start====");
        let result: number = commoneventerror.SetPublishInfoDataSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoDataSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoDataSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublishInfoDataError_1200
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublishInfoDataError_1200
     * @tc.desc    : Test SetPublishInfoDataError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoDataError_1200', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoDataError start====");
        let result: number = commoneventerror.SetPublishInfoDataError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoDataError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoDataError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublishInfoParameterSuccess_1300
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublishInfoParameterSuccess_1300
     * @tc.desc    : Test SetPublishInfoParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoParameterSuccess_1300', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoParameterSuccess start====");
        let result: number = commoneventerror.SetPublishInfoParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetPublishInfoParameterError_1400
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetPublishInfoParameterError_1400
     * @tc.desc    : Test SetPublishInfoParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetPublishInfoParameterError_1400', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetPublishInfoParameterError start====");
        let result: number = commoneventerror.SetPublishInfoParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetPublishInfoParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetPublishInfoParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetIntToParameterSuccess_1500
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetIntToParameterSuccess_1500
     * @tc.desc    : Test SetIntToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetIntToParameterSuccess_1500', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetIntToParameterSuccess start====");
        let result: number = commoneventerror.SetIntToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetIntToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetIntToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetIntToParameterError_1600
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetIntToParameterError_1600
     * @tc.desc    : Test SetIntToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetIntToParameterError_1600', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetIntToParameterError start====");
        let result: number = commoneventerror.SetIntToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetIntToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetIntToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetIntArrayToParameterSuccess_1700
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetIntArrayToParameterSuccess_1700
     * @tc.desc    : Test SetIntArrayToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetIntArrayToParameterSuccess_1700', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetIntArrayToParameterSuccess start====");
        let result: number = commoneventerror.SetIntArrayToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetIntArrayToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetIntArrayToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetIntArrayToParameterError_1800
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetIntArrayToParameterError_1800
     * @tc.desc    : Test SetIntArrayToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetIntArrayToParameterError_1800', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetIntArrayToParameterError start====");
        let result: number = commoneventerror.SetIntArrayToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetIntArrayToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetIntArrayToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetLongToParameterSuccess_1900
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetLongToParameterSuccess_1900
     * @tc.desc    : Test SetLongToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetLongToParameterSuccess_1900', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetLongToParameterSuccess start====");
        let result: number = commoneventerror.SetLongToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetLongToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetLongToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetLongToParameterError_2000
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetLongToParameterError_2000
     * @tc.desc    : Test SetLongToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetLongToParameterError_2000', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetLongToParameterError start====");
        let result: number = commoneventerror.SetLongToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetLongToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetLongToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetLongArrayToParameterSuccess_2100
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetLongArrayToParameterSuccess_2100
     * @tc.desc    : Test SetLongArrayToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetLongArrayToParameterSuccess_2100', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetLongArrayToParameterSuccess start====");
        let result: number = commoneventerror.SetLongArrayToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetLongArrayToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetLongArrayToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetLongArrayToParameterError_2200
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetLongArrayToParameterError_2200
     * @tc.desc    : Test SetLongArrayToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetLongArrayToParameterError_2200', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetLongArrayToParameterError start====");
        let result: number = commoneventerror.SetLongArrayToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetLongArrayToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetLongArrayToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetBoolToParameterSuccess_2300
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetBoolToParameterSuccess_2300
     * @tc.desc    : Test SetBoolToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetBoolToParameterSuccess_2300', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetBoolToParameterSuccess start====");
        let result: number = commoneventerror.SetBoolToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetBoolToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetBoolToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetBoolToParameterError_2400
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetBoolToParameterError_2400
     * @tc.desc    : Test SetBoolToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetBoolToParameterError_2400', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetBoolToParameterError start====");
        let result: number = commoneventerror.SetBoolToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetBoolToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetBoolToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetBoolArrayToParameterSuccess_2500
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetBoolArrayToParameterSuccess_2500
     * @tc.desc    : Test SetBoolArrayToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetBoolArrayToParameterSuccess_2500', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetBoolArrayToParameterSuccess start====");
        let result: number = commoneventerror.SetBoolArrayToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetBoolArrayToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetBoolArrayToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetBoolArrayToParameterError_2600
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetBoolArrayToParameterError_2600
     * @tc.desc    : Test SetBoolArrayToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetBoolArrayToParameterError_2600', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetBoolArrayToParameterError start====");
        let result: number = commoneventerror.SetBoolArrayToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetBoolArrayToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetBoolArrayToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetCharToParameterSuccess_2700
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetCharToParameterSuccess_2700
     * @tc.desc    : Test SetCharToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetCharToParameterSuccess_2700', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetCharToParameterSuccess start====");
        let result: number = commoneventerror.SetCharToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetCharToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetCharToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetCharToParameterError_2800
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetCharToParameterError_2800
     * @tc.desc    : Test SetCharToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetCharToParameterError_2800', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetCharToParameterError start====");
        let result: number = commoneventerror.SetCharToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetCharToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetCharToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetCharArrayToParameterSuccess_2900
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetCharArrayToParameterSuccess_2900
     * @tc.desc    : Test SetCharArrayToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetCharArrayToParameterSuccess_2900', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetCharArrayToParameterSuccess start====");
        let result: number = commoneventerror.SetCharArrayToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetCharArrayToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetCharArrayToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetCharArrayToParameterError_3000
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetCharArrayToParameterError_3000
     * @tc.desc    : Test SetCharArrayToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetCharArrayToParameterError_3000', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetCharArrayToParameterError start====");
        let result: number = commoneventerror.SetCharArrayToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetCharArrayToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetCharArrayToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetDoubleToParameterSuccess_3100
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetDoubleToParameterSuccess_3100
     * @tc.desc    : Test SetDoubleToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetDoubleToParameterSuccess_3100', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetDoubleToParameterSuccess start====");
        let result: number = commoneventerror.SetDoubleToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetDoubleToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetDoubleToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetDoubleToParameterError_3200
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetDoubleToParameterError_3200
     * @tc.desc    : Test SetDoubleToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetDoubleToParameterError_3200', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetDoubleToParameterError start====");
        let result: number = commoneventerror.SetDoubleToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetDoubleToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetDoubleToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetDoubleArrayToParameterSuccess_3300
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetDoubleArrayToParameterSuccess_3300
     * @tc.desc    : Test SetDoubleArrayToParameterSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetDoubleArrayToParameterSuccess_3300', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetDoubleArrayToParameterSuccess start====");
        let result: number = commoneventerror.SetDoubleArrayToParameterSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetDoubleArrayToParameterSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetDoubleArrayToParameterSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SetDoubleArrayToParameterError_3400
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SetDoubleArrayToParameterError_3400
     * @tc.desc    : Test SetDoubleArrayToParameterError
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SetDoubleArrayToParameterError_3400', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_SetDoubleArrayToParameterError start====");
        let result: number = commoneventerror.SetDoubleArrayToParameterError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_SetDoubleArrayToParameterError result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_SetDoubleArrayToParameterError catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_PublishSuccess_3500
     * @tc.name    : Sub_Notification_Ces_CommonEvent_PublishSuccess_3500
     * @tc.desc    : Test PublishSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_PublishSuccess_3500', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_CommonEventPublishSuccess start====");
        let result: number = commoneventerror.PublishSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_CommonEventPublishSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_CommonEventPublishSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_PublishInvalidParameter_3600
     * @tc.name    : Sub_Notification_Ces_CommonEvent_PublishInvalidParameter_3600
     * @tc.desc    : Test PublishInvalidParameter
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_PublishInvalidParameter_3600', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_PublishInvalidParameter start====");
        let result: number = commoneventerror.PublishInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_PublishInvalidParameter result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_PublishInvalidParameter catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_PublishWithInfoSuccess_3700
     * @tc.name    : Sub_Notification_Ces_CommonEvent_PublishWithInfoSuccess_3700
     * @tc.desc    : Test PublishWithInfoSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWithInfoSuccess_3700', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_PublishWithInfoSuccess start====");
        let result: number = commoneventerror.PublishWithInfoSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_PublishWithInfoSuccess result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_PublishWithInfoSuccess catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_PublishWithInfoInvalidParameter_3800
     * @tc.name    : Sub_Notification_Ces_CommonEvent_PublishWithInfoInvalidParameter_3800
     * @tc.desc    : Test PublishWithInfoInvalidParameter
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_PublishWithInfoInvalidParameter_3800', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_CommonEvent_PublishWithInfoInvalidParameter start====");
        let result: number = commoneventerror.PublishWithInfoInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>Sub_CommonEvent_PublishWithInfoInvalidParameter result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_CommonEvent_PublishWithInfoInvalidParameter catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SubscribeSuccess_3900
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SubscribeSuccess_3900
     * @tc.desc    : Test SubscribeSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SubscribeSuccess_3900', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_SubscribeSuccess_3900 start====");
        let result: number = commoneventerror.SubscribeSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_SubscribeSuccess_3900 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_SubscribeSuccess_3900 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded_4000
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded_4000
     * @tc.desc    : Test SubscriberNumExceeded
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded_4000', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded_4000 start====");
        let result: number = commoneventerror.SubscriberNumExceeded();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded_4000 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded_4000 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SubscribeInvalidParameter_4100
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SubscribeInvalidParameter_4100
     * @tc.desc    : Test SubscribeInvalidParameter
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SubscribeInvalidParameter_4100', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_SubscribeInvalidParameter_4100 start====");
        let result: number = commoneventerror.SubscribeInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_SubscribeInvalidParameter_4100 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_SubscribeInvalidParameter_4100 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded1_4200
     * @tc.name    : Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded1_4200
     * @tc.desc    : Test SubscriberNumExceeded1
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded1_4200', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded1_4200 start====");
        let result: number = commoneventerror.SubscriberNumExceeded1();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded1_4200 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_SubscriberNumExceeded1_4200 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_UnSubscribeSuccess_4300
     * @tc.name    : Sub_Notification_Ces_CommonEvent_UnSubscribeSuccess_4300
     * @tc.desc    : Test UnSubscribeSuccess
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_UnSubscribeSuccess_4300', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_UnSubscribeSuccess_4300 start====");
        let result: number = commoneventerror.UnSubscribeSuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_UnSubscribeSuccess_4300 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_UnSubscribeSuccess_4300 catch err: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : Sub_Notification_Ces_CommonEvent_UnSubscribeInvalidParameter_4400
     * @tc.name    : Sub_Notification_Ces_CommonEvent_UnSubscribeInvalidParameter_4400
     * @tc.desc    : Test UnSubscribeInvalidParameter
     * @tc.level   : Level2
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('Sub_Notification_Ces_CommonEvent_UnSubscribeInvalidParameter_4400', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Sub_Notification_Ces_CommonEvent_UnSubscribeInvalidParameter_4400 start====");
        let result: number = commoneventerror.UnSubscribeInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>Sub_Notification_Ces_CommonEvent_UnSubscribeInvalidParameter_4400 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_Notification_Ces_CommonEvent_UnSubscribeInvalidParameter_4400 catch err: " + err);
        expect().assertFail();
      }
    });
  })
}

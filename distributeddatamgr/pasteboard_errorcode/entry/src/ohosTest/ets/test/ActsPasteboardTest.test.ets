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

import { describe, it, expect, Level } from '@ohos/hypium';
import pasteboarderror from 'libpasteboarderrorcode.so';
const Success = 0;

export default function ActsPasteboardErrorTest() {
  describe('ActsPasteboardErrorTest', () => {
    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardRemoteDC_0100
     * @tc.number Sub_PasteboardSubscriber_PasteboardRemoteDC_0100
     * @tc.desc   Test PasteboardRemoteDC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardRemoteDC_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardSubscriber_PasteboardRemoteDC_0100 start====");
        let result: number = pasteboarderror.PasteboardRemoteDC();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardSubscriber_PasteboardRemoteDC_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardSubscriber_PasteboardRemoteDC_0100 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardDestroySuccess_0200
     * @tc.number Sub_PasteboardSubscriber_PasteboardDestroySuccess_0200
     * @tc.desc   Test PasteboardDestroySuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardDestroySuccess_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardSubscriber_PasteboardDestroySuccess_0200 start====");
        let result: number = pasteboarderror.PasteboardDestroySuccess();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardSubscriber_PasteboardDestroySuccess_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardSubscriber_PasteboardDestroySuccess_0200 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardDestroyError_0300
     * @tc.number Sub_PasteboardSubscriber_PasteboardDestroyError_0300
     * @tc.desc   Test PasteboardDestroyError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardDestroyError_0300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardSubscriber_PasteboardDestroyError_0300 start====");
        let result: number = pasteboarderror.PasteboardDestroyError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardSubscriber_PasteboardDestroyError_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardSubscriber_PasteboardDestroyError_0300 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardGetDataSourceInvalidParameter_0400
     * @tc.number Sub_PasteboardSubscriber_PasteboardGetDataSourceInvalidParameter_0400
     * @tc.desc   Test PasteboardGetDataSourceInvalidParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardGetDataSourceInvalidParameter_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardGetDataSourceInvalidParameter_0400 start====");
        let result: number = pasteboarderror.PasteboardGetDataSourceInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardGetDataSourceInvalidParameter_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardGetDataSourceInvalidParameter_0400 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardSetDataInvalidParameter_0500
     * @tc.number Sub_PasteboardSubscriber_PasteboardSetDataInvalidParameter_0500
     * @tc.desc   Test PasteboardSetDataInvalidParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardSetDataInvalidParameter_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardSetDataInvalidParameter_0500 start====");
        let result: number = pasteboarderror.PasteboardSetDataInvalidParameter();
        console.info("====>Sub_PasteboardSetDataInvalidParameter_0500 result: " + result);
        expect(result).assertEqual(Success);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardSetDataInvalidParameter_0500 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0600
     * @tc.number Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0600
     * @tc.desc   Test PasteboardClearDataInvalidParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardClearDataInvalidParameter_0600 start====");
        let result: number = pasteboarderror.PasteboardClearDataInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardClearDataInvalidParameter_0600 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardClearDataInvalidParameter_0600 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0700
     * @tc.number Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0700
     * @tc.desc   Test PasteboardClearDataInvalidParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardClearDataInvalidParameter_0700 start====");
        let result: number = pasteboarderror.PasteboardErrDeviceNotSupported();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardClearDataInvalidParameter_0700 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardClearDataInvalidParameter_0700 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0800
     * @tc.number Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0800
     * @tc.desc   Test PasteboardClearDataInvalidParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardClearDataInvalidParameter_0800 start====");
        let result: number = pasteboarderror.PasteboardErrBusy();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardClearDataInvalidParameter_0800 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardClearDataInvalidParameter_0800 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0900
     * @tc.number Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0900
     * @tc.desc   Test PasteboardClearDataInvalidParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardClearDataInvalidParameter_0900 start====");
        let result: number = pasteboarderror.PasteboardErrPateboardProgressStartError();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardClearDataInvalidParameter_0900 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardClearDataInvalidParameter_0900 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_1000
     * @tc.number Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_1000
     * @tc.desc   Test PasteboardClearDataInvalidParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_PasteboardSubscriber_PasteboardClearDataInvalidParameter_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Sub_PasteboardClearDataInvalidParameter_1000 start====");
        let result: number = pasteboarderror.PasteboardErrPasteBoardProgressAbnormal();
        expect(result).assertEqual(Success);
        console.info("====>Sub_PasteboardClearDataInvalidParameter_1000 result: " + result);
        done()
      } catch (err) {
        console.error("====>Sub_PasteboardClearDataInvalidParameter_1000 catch err: " + err);
        done()
      }
    });
  })
}

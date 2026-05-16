/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import screenLock from '@ohos.screenLock';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index";
 
 
export default function ScreenLockPromiseTest() {
  describe('ScreenLockServicePromiseTest', () => {
    console.info("-----------------------ScreenlockPromiseTest is starting-----------------------");
 
    let result = false;
    beforeEach(async (done: () => void) => {
        result = await screenLock.isScreenLocked();
        done();
    });   
 
    /**
     * @tc.name   SUB_MISC_screenLock_API_Promise_static_0100
     * @tc.number SUB_MISC_screenLock_API_Promise_static_0100
     * @tc.desc   Test ScreenLock API functionality.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("SUB_MISC_screenLock_API_Promise_static_0100", Level.LEVEL2, async (done: () => void) => {
      console.info("------------------start SUB_MISC_screenLock_API_Promise_static_0100-------------------");
      try {
        let data: Boolean = await screenLock.isScreenLocked();
        console.info("SUB_MISC_screenLock_API_Promise_static_0100 isScreenLocked result is " + data);
        expect(data).assertEqual(false);
        console.info("------------------end SUB_MISC_screenLock_API_Promise_static_0100-------------------");
        done();
      } catch (error) {
        console.info("SUB_MISC_screenLock_API_Promise_static_0100 test_setScreenLocked : error = " + error);
        expect().assertFail();
        done();
      }
      
    });
 
    /**
     * @tc.name   SUB_MISC_screenLock_API_Promise_static_0200
     * @tc.number SUB_MISC_screenLock_API_Promise_static_0200
     * @tc.desc   Test ScreenLock API functionality.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("SUB_MISC_screenLock_API_Promise_static_0200", Level.LEVEL2, async (done: () => void) => {
      console.info("------------------start SUB_MISC_screenLock_API_Promise_static_0200-------------------");
      try {
        let data = await screenLock.isSecureMode();
        console.info("SUB_MISC_screenLock_API_Promise_static_0200 isSecureMode result is " + data);
        expect(data).assertEqual(false);
        console.info("------------------end SUB_MISC_screenLock_API_Promise_static_0200-------------------");
        done();
      } catch (error) {
        console.info("SUB_MISC_screenLock_API_Promise_static_0200 isSecureMode TRUE: error = " + error);
        expect().assertFail();
        done();
      }      
    });
  })
}
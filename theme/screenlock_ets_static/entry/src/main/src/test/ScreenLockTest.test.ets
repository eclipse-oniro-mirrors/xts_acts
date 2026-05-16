/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
 
export default function screenLockJSUnit() {
 
    describe('ScreenLockServiceTest', () => {
        console.info("====>-----------------------ScreenlockTest is starting-----------------------");
 
        let result = false
        beforeEach(async (done: () => void) => {
            result = await screenLock.isScreenLocked();
            done();
        });
 
        /**
         * @tc.name   SUB_MISC_screenLock_API_static_0100
         * @tc.number SUB_MISC_screenLock_API_static_0100
         * @tc.desc   Test ScreenLock API functionality.
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level 0
         */
        it("SUB_MISC_screenLock_API_static_0100", Level.LEVEL0, async (done: () => void) => {
            console.info("====>------------------start SUB_MISC_screenLock_API_static_0100-------------------");
            try {
                screenLock.isScreenLocked((err: BusinessError | null, data: Boolean | undefined) => {
                    try{
                        if(err){
                            console.info("====>SUB_MISC_screenLock_API_static_0100 failed because: " + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        expect(data).assertEqual(false);
                        console.info("====>SUB_MISC_screenLock_API_static_0100 screen's status is " + data);
                        console.info("====>------------------end SUB_MISC_screenLock_API_static_0100-------------------");
                        done();
                    } catch (err) {
                        expect(data).assertEqual(true);
                        console.info("====>logMessage SUB_MISC_screenLock_API_static_0100 throw_err = " + err);
                        done();
                    }
                });
            } catch (err) {
                console.info("====>logMessage SUB_MISC_screenLock_API_static_0100: err = " + err);
                expect().assertFail();
                done();
            }            
        });
 
        /**
         * @tc.name   SUB_MISC_screenLock_API_static_0200
         * @tc.number SUB_MISC_screenLock_API_static_0200
         * @tc.desc   Test ScreenLock API functionality.
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level 0
         */
        it("SUB_MISC_screenLock_API_static_0200", Level.LEVEL2, async (done: () => void) => {
            console.info("====>------------------start SUB_MISC_screenLock_API_static_0200-------------------");
            try {
                screenLock.isSecureMode((err: BusinessError | null, data: Boolean | undefined) => {
                    try{
                        console.info("====>SUB_MISC_screenLock_API_static_0200 secureMode's result is " + data);
                        expect(data).assertEqual(false);
                        console.info("====>------------------end SUB_MISC_screenLock_API_static_0200-------------------");
                        done();
                    }catch(err){
                        expect(data).assertEqual(true);
                        console.info("====>logMessage SUB_MISC_screenLock_API_static_0200 throw_err = " + err);
                        done();
                    }                    
                });
            } catch (err) {
                console.info("====>logMessage SUB_MISC_screenLock_API_static_0200: err = " + err);
                expect().assertFail();
                done();
            }            
        });
    });
}
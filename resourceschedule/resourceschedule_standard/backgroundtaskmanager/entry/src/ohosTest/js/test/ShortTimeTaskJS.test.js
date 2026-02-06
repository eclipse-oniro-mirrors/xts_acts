/*
 * Copyright (C) 2022-2025 Huawei Device Co., Ltd.
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
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

export default function ShortTimeTasksJSTest() {
describe("ShortTimeTasksJSTest", function () {
    beforeAll(function() {
        
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll caled')
    })

    afterAll(function() {
        
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll caled')
    })

    beforeEach(function() {
        
        /*
         * @tc.setup: setup invoked before each testcases
         */
         console.info('beforeEach caled')
    })

    afterEach(function() {
        
        /*
         * @tc.teardown: teardown invoked after each testcases
         */
         console.info('afterEach caled')
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_0100
     * @tc.name: ShortTermTasksJSTest0100
     * @tc.desc: test request a suspend delay
     */
    it("ShortTermTasksJSTest0100", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0100---------------------------');
        try {
            function callback() {}
            let info = backgroundTaskManager.requestSuspendDelay("test", callback);
            if (info.requestId != -1) {
                console.info('ShortTermTasksJSTest0100  requestSuspendDelay success, requestId:' + info.requestId);
                expect(info.requestId).assertLarger(0);
                backgroundTaskManager.cancelSuspendDelay(info.requestId);
                done();
            } else {
                console.info('ShortTermTasksJSTest0100  requestSuspendDelay failed, requestId:' + info.requestId);
            }
        } catch (error) {
            console.error(`requestSuspendDelay failed. code is ${error.code} message is ${error.message}`);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_0200
     * @tc.name: ShortTermTasksJSTest0200
     * @tc.desc: test getRemainingDelayTime Promise
     */
    it("ShortTermTasksJSTest0200", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0200---------------------------');
        try {
            function callback() {}
            let info = backgroundTaskManager.requestSuspendDelay("test", callback);
            if (info.requestId != -1) {
                console.info('ShortTermTasksJSTest0200  getRemainingDelayTime success, requestId:' + info.requestId);
            }
            backgroundTaskManager.getRemainingDelayTime(info.requestId).then(res => {
                console.info('ShortTermTasksJSTest0200  getRemainingDelayTime success, delaytime:' + res);
                expect(res).assertLarger(0);
                backgroundTaskManager.cancelSuspendDelay(info.requestId);
                done();
            }).catch(error => {
                console.info('ShortTermTasksJSTest0200  getRemainingDelayTime error' + error.code);
            });
        } catch (error) {
            console.error(`promise => Operation getRemainingDelayTime failed. code is ${error.code} 
            message is ${error.message}`);
        }
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_0300
     * @tc.name: ShortTermTasksJSTest0300
     * @tc.desc: test getRemainingDelayTime Callback
     */
    it("ShortTermTasksJSTest0300", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0300---------------------------');
        try {
            function callback() { }
            let info = backgroundTaskManager.requestSuspendDelay("test", callback);
            if (info.requestId != -1) {
                console.info('ShortTermTasksJSTest0300  requestSuspendDelay success, requestId:' + info.requestId);
            }
            backgroundTaskManager.getRemainingDelayTime(info.requestId, (err, res) => {
                if (!err) {
                    console.info('ShortTermTasksJSTest0300  getRemainingDelayTime success, delaytime:' + res);
                    expect(res).assertLarger(0);
                    backgroundTaskManager.cancelSuspendDelay(info.requestId);
                    done();
                } else {
                    console.info('ShortTermTasksJSTest0300  getRemainingDelayTime error' + err.code);
                }
            });
        } catch (error) {
            console.error(`promise => Operation getRemainingDelayTime failed. code is ${error.code} 
            message is ${error.message}`);
        }
    })
	
	/*
     * @tc.number:SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_0400
     * @tc.name: ShortTermTasksJSTest0400
     * @tc.desc: test DelaySuspendInfo actualDelayTime
     */
    it("ShortTermTasksJSTest0400", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0400---------------------------');
        try {
            function callback() { }
            let info = backgroundTaskManager.requestSuspendDelay("123456", callback);
            if (info.actualDelayTime != -1) {
                console.info('ShortTermTasksJSTest0400  DelaySuspendInfo actualDelayTime:' +
                    info.actualDelayTime);
                backgroundTaskManager.cancelSuspendDelay(info.requestId);
                expect(info.actualDelayTime).assertLarger(0);
                done();
            } else {
                console.info('ShortTermTasksJSTest0400  requestSuspendDelay error' + err.code);
            }
        } catch (error) {
            console.error(`requestSuspendDelay failed. code is ${error.code} message is ${error.message}`);
        }
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_0500
     * @tc.name      ShortTermTasksJSTest0500
     * @tc.desc      test request a suspend daly reason is NumberType.
     */
    it("ShortTermTasksJSTest0500", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0500---------------------------');
        function callback() {}
        let reason = 123;
        try{
            let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
            if (info.requestId === -1) {
                console.info('ShortTermTasksJSTest0500 requestSuspendDelay fail, because of reason is :' + 
                reason);
            } else {
                console.info('ShortTermTasksJSTest0500 requestSuspendDelay success,requestId:' + 
                info.requestId);
            }
        }catch(error){
            console.info('ShortTermTasksJSTest0500 requestSuspendDelay fail, because of :' + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_08=600
     * @tc.name      ShortTermTasksJSTest0600
     * @tc.desc      test request a suspend daly reason is BooleanType.
     */
    it("ShortTermTasksJSTest0600", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0600---------------------------');
        function callback() { }
        let reason = true;
        try {
            let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
            if (info.requestId === -1) {
                console.info('ShortTermTasksJSTest0600 requestSuspendDelay fail, because of reason is :' +
                    reason);
            } else {
                console.info('ShortTermTasksJSTest0600 requestSuspendDelay success,requestId:' +
                    info.requestId);
            }
        } catch (error) {
            console.info('ShortTermTasksJSTest0600 requestSuspendDelay fail, because of :' + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_0700
     * @tc.name      ShortTermTasksJSTest0700
     * @tc.desc      test request a suspend daly reason is NullType.
     */
    it("ShortTermTasksJSTest0700", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0700---------------------------');
        function callback() { }
        let reason = null;
        try {
            let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
            if (info.requestId === -1) {
                console.info('ShortTermTasksJSTest0700 backgroundTaskManager fail, because of reason is :' +
                    reason);
            } else {
                console.info('ShortTermTasksJSTest0700 backgroundTaskManager success,requestId:' +
                    info.requestId);
            }
        } catch (error) {
            console.info('ShortTermTasksJSTest0700 backgroundTaskManager fail, because of :' + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
        done();
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_0800
     * @tc.name      ShortTermTasksJSTest0800
     * @tc.desc      test request a suspend daly reason is EmptyString.
     */
    it("ShortTermTasksJSTest0800", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0800---------------------------');
        function callback() {}
        let reason = "";
        try{
            let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
            if (info.requestId === -1) {
                console.info('ShortTermTasksJSTest0800 backgroundTaskManager fail, because of reason is :' + 
                reason);
            } else {
                console.info('ShortTermTasksJSTest0800 backgroundTaskManager success,requestId:' + 
                info.requestId);
            }
        }catch(error){
            console.info('ShortTermTasksJSTest0800 backgroundTaskManager fail, because of :' + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
        done();
    })


    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_0900
     * @tc.name      ShortTermTasksJSTest0900
     * @tc.desc      test request a suspend daly reason Undefined.
     */
    it("ShortTermTasksJSTest0900", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest0900---------------------------');
        function callback() {}
        let reason;
        try{
            let info = backgroundTaskManager.requestSuspendDelay(reason, callback);
            if (info.requestId === -1) {
                console.info('ShortTermTasksJSTest0900 backgroundTaskManager fail, because of reason is :' + 
                reason);
            } else {
                console.info('ShortTermTasksJSTest0900 backgroundTaskManager success,requestId:' + 
                info.requestId);
            }
        }catch(error){
            console.info('ShortTermTasksJSTest0900 backgroundTaskManager fail, because of :' + error.code);
            expect(error.code).assertEqual("401");
            done();
        }
        done();
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_1000
     * @tc.name      ShortTermTasksJSTest1000
     * @tc.desc      test getRemainingDelayTime Callback ,requestId non-existent.
     */
    it("ShortTermTasksJSTest1000", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest1000---------------------------');
        function callback() {}
        let info = backgroundTaskManager.requestSuspendDelay("test", callback);
        if (info.requestId != -1) {
            console.info('ShortTermTasksJSTest1000 backgroundTaskManager success, requestId:' + 
            info.requestId);
        } 
        try {
            backgroundTaskManager.getRemainingDelayTime(info.requestId+1, (err, res) => {
                if (err) {
                    console.info('ShortTermTasksJSTest1000 backgroundTaskManager error,cause:' + err.code);
                    expect(err.code).assertEqual(9900001);
                    done();
                } else {
                    console.info('ShortTermTasksJSTest1000 backgroundTaskManager success, delaytime:' + res);
                }
                backgroundTaskManager.cancelSuspendDelay(info.requestId)
            });
        } catch (error) {
            console.error(`promise => Operation getRemainingDelayTime failed. code is ${error.code} 
            message is ${error.message}`);
        }
    })

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_1100
     * @tc.name      ShortTermTasksJSTest1100
     * @tc.desc      test getRemainingDelayTime Promise ,requestId non-existent.
     */
    it("ShortTermTasksJSTest1100", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest1100---------------------------');
        function callback() { }
        let info = backgroundTaskManager.requestSuspendDelay("test", callback);
        if (info.requestId != -1) {
            console.info('ShortTermTasksJSTest1100 backgroundTaskManager success, requestId:' +
                info.requestId);
        }
        try {
            backgroundTaskManager.getRemainingDelayTime(info.requestId + 1).then(res => {
                console.info('ShortTermTasksJSTest1100 backgroundTaskManager success, delaytime:' + res);
            }).catch(err => {
                console.info('ShortTermTasksJSTest1100 backgroundTaskManager error,cause:' + err.code);
                expect(err.code).assertEqual(9900001);
                done();
            });
            backgroundTaskManager.cancelSuspendDelay(info.requestId);
        } catch (error) {
            console.error(`promise => Operation getRemainingDelayTime failed. code is ${error.code} 
            message is ${error.message}`);
        }
    })   

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_1200
     * @tc.name      ShortTermTasksJSTest1200
     * @tc.desc      test getRemainingDelayTime Promise ,requestId is null.
     */
    it("ShortTermTasksJSTest1200", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest1200---------------------------');
        let requestId = null;
        try {
            backgroundTaskManager.getRemainingDelayTime(requestId).then(res => {
                console.info('ShortTermTasksJSTest1200 backgroundTaskManager success, delaytime:' + res);
            }).catch(err => {
                console.info('ShortTermTasksJSTest1200 backgroundTaskManager error,cause:' + err.code);
            });
        } catch (error) {
            console.error(`promise => Operation getRemainingDelayTime failed. code is ${error.code} 
            message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })   

    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_1300
     * @tc.name      ShortTermTasksJSTest1300
     * @tc.desc      test getRemainingDelayTime Callback ,requestId = -1.
     */
    it("ShortTermTasksJSTest1300", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest1300---------------------------');
        let requestId = -1;
        try {
            backgroundTaskManager.getRemainingDelayTime(requestId, (err, res) => {
                if (err) {
                    console.info('ShortTermTasksJSTest1300 backgroundTaskManager error,cause:' + err.code);
                } else {
                    console.info('ShortTermTasksJSTest1300 backgroundTaskManager success, delaytime:' + res);
                }
            });
        } catch (error) {
            console.error(`promise => Operation getRemainingDelayTime failed. code is ${error.code} 
            message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })
    
    /*
     * @tc.number    SUB_RESOURCESCHEDULE_SHORT_TASK_XTS_1400
     * @tc.name      ShortTermTasksJSTest1400
     * @tc.desc      test getRemainingDelayTime Promise ,requestId = 0.
     */
    it("ShortTermTasksJSTest1400", Level.LEVEL0, async function (done) {
        console.info('----------------------ShortTermTasksJSTest1400---------------------------');
        let requestId = 0;
        try {
            backgroundTaskManager.getRemainingDelayTime(requestId).then(res => {
                console.info('ShortTermTasksJSTest1400 backgroundTaskManager success, delaytime:' + res);
            }).catch(err => {
                console.info('ShortTermTasksJSTest1400 backgroundTaskManager error,cause:' + err.code);
            });
        } catch (error) {
            console.error(`promise => Operation getRemainingDelayTime failed. code is ${error.code} 
            message is ${error.message}`);
            expect(error.code).assertEqual("401");
            done();
        }
    })
})
}

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

import power from '@ohos.power';

import { describe, it, expect } from '@ohos/hypium'

export default function PowerManagerRebootShutTest() {
describe('PowerManagerRebootShutTest', function () {
    console.log("*************Power Unit Test Begin*************");
    
    /**
     * @tc.number power_js_001
     * @tc.name power_creat_shutdownDevice_test
     * @tc.desc Device shutdown interface validation
     */
     it('creat_shutdownDevice_test01', 0, async function () {
        function shutPromise(){
            new Promise(function(resolve,reject){
                power.isScreenOn((error, screenOn)=>{
                    if(screenOn){
                        console.log('devices shutdown error');
                        reject(screenOn);
                    }else{
                        console.log('devices shutdown success');
                        resolve(error);
                    }
                },1000)
            })
        }
        power.shutdownDevice("shutsown");
        shutPromise();
    })

    /**
     * @tc.number power_js_002
     * @tc.name power_creat_shutdownDevice_test
     * @tc.desc Device shutdown interface validation
     */
    it('creat_shutdownDevice_test02', 0, async function () {
        power.isScreenOn()
            .then(screenOn => {
                console.info('power_shutdownDevice_test: The current screenOn is ' + screenOn);
                if (!screenOn) { 
                    power.wakeupDevice("power_shutdownDevice_test");
                } 
            })
            .catch(error => {
                console.log('power_shutdownDevice_test error: ' + error);
                expect().assertFail();
                done();
            })
        power.shutdownDevice("shutsown");
        console.info('power_shutdownDevice_test: shutdownDevice end');
        setTimeout(function(){
            power.isScreenOn()
            .then(screenOn => {
                console.info('power_shutdownDevice_test: The current screenOn is ' + screenOn);
                expect(screenOn).assertFalse();
                console.info('power_shutdownDevice_test success');
                done();
            })
            .catch(error => {
                console.log('power_shutdownDevice_test error: ' + error);
                expect().assertFail();
                done();
            })
        }, 2000); 
    })

    /**
     * @tc.number power_js_003
     * @tc.name power_creat_rebootDeviceDevice_test
     * @tc.desc Device reboot interface verification
     */
    it('creat_rebootDeviceDevice_test', 0, async function () {
        power.isScreenOn()
            .then(screenOn => {
                console.info('power_rebootDevice_test: The current screenOn is ' + screenOn);
                if (!screenOn) { 
                    power.wakeupDevice("power_rebootDevice_test");
                } 
            })
            .catch(error => {
                console.log('power_rebootDevice_test error: ' + error);
                expect().assertFail();
                done();
            })
        power.rebootDevice("shutsown");
        console.info('power_rebootDevice_test: rebootDevice end');
        setTimeout(function(){
            power.isScreenOn()
            .then(screenOn => {
                console.info('power_rebootDevice_test: The current screenOn is ' + screenOn);
                expect(screenOn).assertFalse();
                console.info('power_rebootDevice_test success');
                done();
            })
            .catch(error => {
                console.log('power_rebootDevice_test error: ' + error);
                expect().assertFail();
                done();
            })
        }, 2000); 
    })
})}

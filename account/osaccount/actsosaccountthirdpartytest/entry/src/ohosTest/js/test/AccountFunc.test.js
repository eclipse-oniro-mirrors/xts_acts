/**
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

import osAccount from '@ohos.account.osAccount'
import { Driver, ON } from '@ohos.UiTest'
import deviceInfo from '@ohos.deviceInfo'

let osAccountManager = osAccount.getAccountManager();
let manager = osAccount.getAuthorizationManager();
let privilege = 'ohos.privilege.manage_local_accounts';
let teeToken = undefined;
let deviceType = deviceInfo.deviceType;
console.info("====>the value of the deviceinfo deviceType is: " + deviceType);
let startTime = 0;

export async function AcquireAuthorization() {
    console.info("====>in AcquireAuthorization");
    let driver = Driver.create();
    let status = await manager.hasAuthorization(privilege);
    console.info("====>hasAuthorization data: " + JSON.stringify(status));
    if (status) {
        let costTime = Date.now() - startTime;
        if (costTime < 250000) {
            return teeToken;
        } else {
            console.info("====>The token is about to expire, start release and reAcquire, cost: " + JSON.stringify(costTime));
            await manager.releaseAuthorization(privilege);
        }
    }
    let configParams = {
        'uri': 'test.example.com',
        'port': 100
    };
    try {
        console.info("====>start addServerConfig");
        await osAccount.DomainServerConfigManager.addServerConfig(configParams);
        console.info("====>run err");
    } catch (err) {
        console.info("====>catch err: " + JSON.stringify(err));
        if (err.code === 801) {
            console.info("====>Current device not support API: addServerConfig");
            console.info("====>Current device not support API: acquireAuthorization");
        } else {
            setTimeout(async () => {
                try {
                    let button = await driver.findComponent(ON.text("确定"));
                    if (button) {
                        await button.click();
                        console.info("====>click confirm end");
                    }
                } catch (err) {
                    console.info("====>findComponent err: " + JSON.stringify(err));
                }
            }, 2000)
            console.info("====>start acquireAuthorization and confirm");
            let option = {};
            option.isReuseNeeded = true;
            option.isInteractionAllowed = true;
            let data = await manager.acquireAuthorization(privilege, option);
            console.info("====>acquireAuthorization data: " + JSON.stringify(data));
            startTime = Date.now();
            console.info("====>token effective start time: " + JSON.stringify(startTime));
            teeToken = data.token;
        }
    }
    return teeToken;
}

export async function CreateAccount(name, type, options) {
    console.info("====>in CreateAccount");
    try {
        let data = await AcquireAuthorization();
        console.info("====>CreateAccount token: " + JSON.stringify(data));
        let createOptions = options
        createOptions.token = data
        let osAccountInfo = await osAccountManager.createOsAccount(name, type, createOptions);
        console.info("====>CreateAccount createOsAccount: " + JSON.stringify(osAccountInfo));
        return osAccountInfo;
    } catch (err) {
        console.info("====>CreateAccount createOsAccount err: " + JSON.stringify(err));
        throw err;
    }
}

export async function RemoveAccount(id) {
    console.info("====>in RemoveAccount");
    try {
        let data = await AcquireAuthorization();
        console.info("====>RemoveAccount token: " + JSON.stringify(data));
        let removeOptions = undefined;
        if (teeToken) {
            removeOptions = {}
            removeOptions.token = data
        }
        await osAccountManager.removeOsAccount(id, removeOptions);
        console.info("====>RemoveAccount removeOsAccount success");
    } catch (err) {
        console.info("====>RemoveAccount removeOsAccount err:" + JSON.stringify(err));
        throw err;
    }
}
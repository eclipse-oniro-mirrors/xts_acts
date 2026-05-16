/**
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

import osAccount from '@ohos.account.osAccount'
import { Driver, ON } from '@ohos.UiTest'
import deviceInfo from '@ohos.deviceInfo'
import { BusinessError, RecordData } from '@ohos.base'
import hilog from '@ohos.hilog'

let osAccountManager = osAccount.getAccountManager();
let manager = osAccount.getAuthorizationManager();
let privilege = 'ohos.privilege.manage_local_accounts';
let teeToken: Uint8Array | undefined = undefined;
let deviceType = deviceInfo.deviceType;
let startTime: double = 0;

let tag: string = 'testTag';
hilog.info(0x0000, tag, "====>the value of the deviceinfo deviceType is: " + deviceType);

export async function AcquireAuthorization(): Promise<Uint8Array | undefined> {
    hilog.info(0x0000, tag, "====>in AcquireAuthorization");
    let driver = Driver.create();
    let status = await manager.hasAuthorization(privilege);
    hilog.info(0x0000, tag, "====>hasAuthorization data: " + JSON.stringify(status));
    if (status) {
        let costTime: double = Date.now() - startTime;
        if (costTime < 250000) {
            return teeToken;
        } else {
            hilog.info(0x0000, tag, "====>The token is about to expire, start release and reAcquire, cost: " + JSON.stringify(costTime));
            await manager.releaseAuthorization(privilege);
        }
    }
    let configParams: Record<string, RecordData> = {
        'uri': 'test.example.com',
        'port': 100
    };
    try {
        hilog.info(0x0000, tag, "====>start addServerConfig");
        await osAccount.DomainServerConfigManager.addServerConfig(configParams);
        hilog.info(0x0000, tag, "====>run err");
    } catch (err) {
        hilog.info(0x0000, tag, "====>catch err: " + JSON.stringify(err));
        if (err.code === 801) {
            hilog.info(0x0000, tag, "====>Current device not support API: addServerConfig");
            hilog.info(0x0000, tag, "====>Current device not support API: acquireAuthorization");
        } else {
            setTimeout(async () => {
                try {
                    let button = await driver.findComponent(ON.text("确定"));
                    if (button) {
                        await button.click();
                        hilog.info(0x0000, tag, "====>click confirm end");
                    }
                } catch (err) {
                    hilog.info(0x0000, tag, "====>findComponent err: " + JSON.stringify(err));
                }
            }, 2000)
            hilog.info(0x0000, tag, "====>start acquireAuthorization and confirm");
            let option: osAccount.AcquireAuthorizationOptions = {};
            option.isReuseNeeded = true;
            option.isInteractionAllowed = true;
            let data = await manager.acquireAuthorization(privilege, option);
            hilog.info(0x0000, tag, "====>acquireAuthorization data: " + JSON.stringify(data));
            startTime = Date.now();
            hilog.info(0x0000, tag, "====>token effective start time: " + JSON.stringify(startTime));
            teeToken = data.token;
        }
    }
    return teeToken;
}

export async function CreateAccount(name: string, type: osAccount.OsAccountType, options: osAccount.CreateOsAccountOptions): Promise<osAccount.OsAccountInfo | BusinessError> {
    hilog.info(0x0000, tag, "====>in CreateAccount");
    try {
        let data = await AcquireAuthorization();
        hilog.info(0x0000, tag, "====>CreateAccount token: " + JSON.stringify(data));
        let createOptions = options
        createOptions.token = data
        let osAccountInfo = await osAccountManager.createOsAccount(name, type, createOptions);
        hilog.info(0x0000, tag, "====>CreateAccount createOsAccount: " + JSON.stringify(osAccountInfo));
        return osAccountInfo;
    } catch (err) {
        err = err as BusinessError<void>;
        hilog.info(0x0000, tag, "====>CreateAccount createOsAccount err: " + JSON.stringify(err));
        throw err;
    }
}

export async function RemoveAccount(id: int): Promise<BusinessError | undefined> {
    hilog.info(0x0000, tag, "====>in RemoveAccount");
    try {
        let data = await AcquireAuthorization();
        hilog.info(0x0000, tag, "====>RemoveAccount token: " + JSON.stringify(data));
        if (teeToken) {
            let removeOptions: osAccount.RemoveOsAccountOptions = {};
            removeOptions.token = data
            await osAccountManager.removeOsAccount(id, removeOptions);
        } else {
            await osAccountManager.removeOsAccount(id);
        }
        hilog.info(0x0000, tag, "====>RemoveAccount removeOsAccount success");
        return;
    } catch (err) {
        err = err as BusinessError<void>;
        hilog.info(0x0000, tag, "====>RemoveAccount removeOsAccount err:" + JSON.stringify(err));
        throw err;
    }
}
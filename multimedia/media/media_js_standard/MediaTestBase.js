/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import resourceManager from '@ohos.resourceManager';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import {expect} from 'deccjsunit/index'
import router from '@system.router'
import fs from '@ohos.file.fs';
import fileio from '@ohos.fileio'
import featureAbility from '@ohos.ability.featureAbility'
import { UiDriver, BY, PointerMatrix } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
const CODECMIMEVALUE = ['video/avc', 'audio/mp4a-latm', 'audio/mpeg']
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
export async function getPermission(permissionNames) {
    featureAbility.getContext().requestPermissionsFromUser(permissionNames, 0, async (data) => {
        console.info("case request success" + JSON.stringify(data));
    })
}

export async function driveFn(num) {
    console.info(`case come in driveFn 111`)
    let driver = await UiDriver.create()
    console.info(`case come in driveFn 222`)
    console.info(`driver is ${JSON.stringify(driver)}`)
    await msleepAsync(2000)
    console.info(`UiDriver start`)
    for (let i = 0; i < num; i++) {
        let button = await driver.findComponent(BY.text('允许'))
        if(button == null){
            let cmd = "hidumper -s WindowManagerService -a'-a'"
            await delegator.executeShellCommand(cmd);
            continue;
        } 
        console.info(`button is ${JSON.stringify(button)}`)
        await msleepAsync(2000)
        if(await driver.findComponent(BY.text('允许')) != null){
            await button.click()
        }
        await msleepAsync(2000)
    }
    await msleepAsync(2000)
}

// File operation
export async function getFileDescriptor(fileName) {
    let fileDescriptor = undefined;
    await resourceManager.getResourceManager().then(async (mgr) => {
        await mgr.getRawFileDescriptor(fileName).then(value => {
            fileDescriptor = {fd: value.fd, offset: value.offset, length: value.length};
            console.log('case getRawFileDescriptor success fileName: ' + fileName);
        }).catch(error => {
            console.log('case getRawFileDescriptor err: ' + error);
        });
    });
    return fileDescriptor;
}
export async function getStageFileDescriptor(fileName) {
    let fileDescriptor = undefined;
    let mgr = globalThis.abilityContext.resourceManager
    await mgr.getRawFileDescriptor(fileName).then(value => {
        fileDescriptor = {fd: value.fd, offset: value.offset, length: value.length};
        console.log('case getRawFileDescriptor success fileName: ' + fileName);
    }).catch(error => {
        console.log('case getRawFileDescriptor err: ' + error);
    });
    return fileDescriptor;
}
export async function closeFileDescriptor(fileName) {
    await resourceManager.getResourceManager().then(async (mgr) => {
        await mgr.closeRawFileDescriptor(fileName).then(()=> {
            console.log('case closeRawFileDescriptor ' + fileName);
        }).catch(error => {
            console.log('case closeRawFileDescriptor err: ' + error);
        });
    });
}

export async function getStageFd(fileName) {
    let fileDescriptor = undefined;
    let mgr = globalThis.abilityContext.resourceManager;
    await mgr.getRawFd(fileName).then(value => {
        fileDescriptor = {fd: value.fd, offset: value.offset, length: value.length};
        console.log('case getRawFd success fileName: ' + fileName);
    }).catch(error => {
        console.log('case getRawFd err: ' + fileName);
        console.log('case getRawFd err: ' + error);
    });
    return fileDescriptor;
}

export async function closeStageFd(fileName) {
    await resourceManager.getResourceManager().then(async (mgr) => {
        await mgr.closeRawFd(fileName).then(()=> {
            console.log('case closeRawFd ' + fileName);
        }).catch(error => {
            console.log('case closeRawFd err: ' + error);
        });
    });
}

export function isFileOpen(fileDescriptor, done) {
    if (fileDescriptor == undefined) {
        expect().assertFail();
        console.info('case error fileDescriptor undefined, open file fail');
        done();
    }
}

export async function getFdRead(pathName, done) {
    let fdReturn;
    await featureAbility.getContext().getFilesDir().then((fileDir) => {
        console.info("case file dir is" + JSON.stringify(fileDir));
        pathName = fileDir + '/' + pathName;
        console.info("case pathName is" + pathName);
    });
    await fileio.open(pathName).then((fdNumber) => {
        isFileOpen(fdNumber, done)
        fdReturn = fdNumber;
        console.info('[fileio]case open fd success, fd is ' + fdReturn);
    })
    return fdReturn;
}

export async function closeFdNumber(fdNumber) {
    await fileio.close(fdNumber);
}

// wait synchronously 
export function msleep(time) {
    for(let t = Date.now();Date.now() - t <= time;);
}

// wait asynchronously
export async function msleepAsync(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}

export function printError(error, done) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
    done();
}

export function assertErr(opera, err, done) {
    console.info(`case ${opera} error,errMessage is ${err.message}`);
    expect().assertFail();
    done();
}

// callback function for promise call back error
export function failureCallback(error) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
}

// callback function for promise catch error
export function catchCallback(error) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
}

export function checkDescription(actualDescription, descriptionKey, descriptionValue) {
    for (let i = 0; i < descriptionKey.length; i++) {
        let property = actualDescription[descriptionKey[i]];
        console.info('case key is  '+ descriptionKey[i]);
        console.info('case actual value is  '+ property);
        console.info('case hope value is  '+ descriptionValue[i]);
        if (descriptionKey[i] == 'codec_mime') {
            console.info('CODECMIMEVALUE[descriptionValue[i]] value is  '+ CODECMIMEVALUE[descriptionValue[i]]);
            if(property == "video/x-h264"){
                console.info('property attribute is:'+ property);
            }else{
                expect(property).assertEqual(CODECMIMEVALUE[descriptionValue[i]]);
            }
        } else if (descriptionKey[i] == 'bitrate') {
            expect(Math.abs(property - descriptionValue[i])).assertLess(500);
        } else {
            expect(property).assertEqual(descriptionValue[i]);
        }
        
    }
}

export function checkPlaybackInfo(actualDescription, descriptionKey, descriptionValue) {
    for (let i = 0; i < descriptionKey.length; i++) {
        let property = actualDescription[descriptionKey[i]];
        console.info('case key is  ' + descriptionKey[i]);
        console.info('case actual value is  ' + property);
        console.info('case hope value is  ' + descriptionValue[i]);
        expect(property).assertEqual(descriptionValue[i]);
    }
}

export function checkOldDescription(actualDescription, descriptionKey, descriptionValue) {
    for (let i = 0; i < descriptionKey.length; i++) {
        let property = actualDescription[descriptionKey[i]];
        console.info('case key is  '+ descriptionKey[i]);
        console.info('case actual value is  '+ property);
        console.info('case hope value is  '+ descriptionValue[i]);
        if (descriptionKey[i] === 'bitrate'){
            expect(Math.abs(property - descriptionValue[i])).assertLess(500);
            return;
        }
        expect(property).assertEqual(descriptionValue[i]);
    }
}

export function printDescription(obj) { 
    let description = ""; 
    for(let i in obj) { 
        let property = obj[i];
        console.info('case key is  '+ i);
        console.info('case value is  '+ property);
        description += i + " = " + property + "\n"; 
    } 
}

export async function toNewPage(pagePath1, pagePath2, page) {
    let path = '';
    if (page == 0) {
        path = pagePath1;
    } else {
        path = pagePath2;
    }
    let options = {
        uri: path,
    }
    try {
        await router.push(options);
    } catch {
        console.info('case route failed');
    }
}

export async function clearRouter() {
    await router.clear();
}

export async function saveVideo(asset) {
    console.info('case saveVideo start');
    try {
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(featureAbility.getContext());
        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.saveCameraPhoto();
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info('case saveVideo successfully');
    } catch (error) {
        console.info(`case error called,errMessage is ${error.message}`);
    }
    console.info('case saveVideo end');
}

export async function getFd(pathName) {
    console.info('case come in getFd')
    let fdObject = {
        fileAsset : null,
        fdNumber : null
    }
    
    await featureAbility.getContext().getFilesDir().then((fileDir) => {
        console.info("case file dir is" + JSON.stringify(fileDir));
        pathName = fileDir + '/' + pathName;
        console.info("case pathName is" + pathName);
    });
    
    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdObject.fileAsset = file;
    fdObject.fdNumber = file.fd;
    console.info('case getFd number is: ' + fdObject.fdNumber);
    
    return fdObject;
}

export async function closeFd(fdNumber) {
    console.info('case come in closeFd')
    if (fdNumber != null) {
        fs.closeSync(fdNumber);
    } else {
        console.info('[fs.closeSync] case fdNumber is null');
    }
}

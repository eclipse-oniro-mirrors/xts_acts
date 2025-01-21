/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import drm from '@ohos.multimedia.drm';
import http from '@ohos.net.http';
import util from '@ohos.util';
import media from '@ohos.multimedia.media';
import { ErrorCode } from '@ohos.ability.errorCode';
import { BusinessError } from '@ohos.base';

let uuid:string;
let sysSupport = drm.isMediaKeySystemSupported("com.clearplay.drm");
console.log("sysSupport is", sysSupport);
if (sysSupport === true) {
    uuid = "com.clearplay.drm";
} else {
    uuid = "com.wiseplay.drm";
}

const sleep = (ms: number) => {
    return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export async function getHttpData(url: string, _extraData: Object):Promise<string>{
    let responseData: string = 'defaultStr';
    let httpRequest = http.createHttp();
    let response = httpRequest.request(
        url,
        {
            method: http.RequestMethod.POST,
            header: {
                'Content-Type': 'application/json'
            },
            extraData : _extraData,
            expectDataType: http.HttpDataType.STRING,
        }
    );
    await response.then((data) => {
        if (data.responseCode == 200) {
            console.info("getHttpData success")
            if(typeof data.result == 'string'){
                responseData = data.result;
            } else {
                console.info("getHttpData Failed 1")
            }
        } else {
            // todo 请求失败，进行失败逻辑处理
            console.info("getHttpData Failed 2")
        }
    }).catch((err:BusinessError) => {
        // todo 请求失败，进行失败逻辑处理
        console.info('getHttpData error:' + JSON.stringify(err));
    })
    console.info("getHttpData end")
    return responseData;
}

function stringToUint8Array(str:string) {
    const length = str.length;
    const array = new Uint8Array(length);

    for (let i = 0; i < length; i++) {
        array[i] = str.charCodeAt(i);
    }

    return array;
}

function byteToString(arr:Uint8Array) {
    if(typeof arr === 'string') {
        return arr;
    }
    let str = '',
        _arr = arr;
    for(let i = 0; i < _arr.length; i++) {
        let one = _arr[i].toString(2),
            v = one.match(new RegExp('^1+?(?=0)'));
        if(v && one.length == 8) {
            let bytesLength = v[0].length;
            let store = _arr[i].toString(2).slice(7 - bytesLength);
            for(let st = 1; st < bytesLength; st++) {
                store += _arr[st + i].toString(2).slice(2);
            }
            str += String.fromCharCode(parseInt(store, 2));
            i += bytesLength - 1;
        } else {
            str += String.fromCharCode(_arr[i]);
        }
    }
    return str;
}

export default function abilityTest() {
    describe('ActsAbilityTest', () => {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(() => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        });
        beforeEach(() => {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
        });
        afterEach(() => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        });
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        });
        console.info("--------------------assertContain-------Stage-----------------------");

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_0100
        * @tc.name      : test mediaKeySystemInfos
        * @tc.desc      : create AVPlayer to getMediaKeySystemInfos
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_0100', 0, async (done:Function) => {
            let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
            let session = drmMediaKeySystem.createMediaKeySession();
            let avPlayer = await media.createAVPlayer();
            avPlayer.setDecryptionConfig(session, false);
            expect(1).assertEqual(1);
            session.destroy();
            drmMediaKeySystem.destroy();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_0200
        * @tc.name      : test mediaKeySystemInfos
        * @tc.desc      : create AVPlayer to getMediaKeySystemInfos
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_0200', 0, async (done:Function) => {
            let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
            let avPlayer = await media.createAVPlayer();
            let MediaKeySystemInfo = avPlayer.getMediaKeySystemInfos();
            if (MediaKeySystemInfo && MediaKeySystemInfo.length > 0) {
                for (let item = 0; item < MediaKeySystemInfo.length; item++) {
                    console.info(`getMediaKeySystemInfos item:${item}, MediaKeySystemInfo[${item}].uuid:${MediaKeySystemInfo[item].uuid}, MediaKeySystemInfo[${item}].pssh:${MediaKeySystemInfo[item].pssh}`);
                }
            }
            expect(MediaKeySystemInfo).assertUndefined();
            drmMediaKeySystem.destroy();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0100
        * @tc.name      : testCreateMediaKeySystem
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0100', 0, async (done:Function) => {
            let errCode = 0;
            try {
                let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
                expect(drmMediaKeySystem).not();
                drmMediaKeySystem.destroy();
                let metric = drmMediaKeySystem.getStatistics();
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_0100 err end", err.code);
                errCode = err.code;
            }
            expect(errCode).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0200
        * @tc.name      : testCreateMediaKeySystem
        * @tc.desc      : Abnormal UUID
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0200', 1, async (done:Function) => {
            let errCode = 0;
            try {
                let drmMediaKeySystem = drm.createMediaKeySystem("405E6D359B9A41E8B843DD3C6E72C42C");
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_0200 createMediaKeySystem err end", err.code);
                errCode = err.code;
            }
            expect(errCode).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0300
        * @tc.name      : testCreateMediaKeySystem
        * @tc.desc      : null UUID
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0300', 1, async (done:Function) => {
            let errCode = 0;
            try {
                let drmMediaKeySystem = drm.createMediaKeySystem("");
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_0300 createMediaKeySystem err end", err.code);
                errCode = err.code;
            }
            expect(errCode).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0400
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : one params error uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0400', 1, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C");
            expect(isSysSupport).assertFalse();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0500
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : one params null uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0500', 1, async (done:Function) => {
            let errCode = 0;
            try {
                let isSysSupport = drm.isMediaKeySystemSupported("");
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_0500 isMediaKeySystemSupported err end", err.code);
                errCode = err.code;
            }
            expect(errCode).assertEqual(401);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0600
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0600', 0, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4");
            expect(isSysSupport).assertTrue();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0700
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params error uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0700', 1, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C", "video/mp4");
            expect(isSysSupport).assertFalse();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0800
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params null uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0800', 1, async (done:Function) => {
            let errCode = 0;
            try {
                let isSysSupport = drm.isMediaKeySystemSupported("", "video/mp4");
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_0800 isMediaKeySystemSupported err end", err.code);
                errCode = err.code;
            }
            expect(errCode).assertEqual(401);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0900
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params error mimetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0900', 1, (done:Function) => {
            if(sysSupport === true){
                let isSysSupport = drm.isMediaKeySystemSupported(uuid, "1111/2222");
                expect(isSysSupport).assertFalse();
            } else {
                let isSysSupport = drm.isMediaKeySystemSupported(uuid, "1111/2222");
                expect(isSysSupport).assertTrue();
            }
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1000
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params null mimetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1000', 1, (done:Function) => {
            let errCode = 0;
            try {
                let isSysSupport = drm.isMediaKeySystemSupported(uuid, "");
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_1000 isMediaKeySystemSupported err end", err.code);
                errCode = err.code;
            }
            expect(errCode).assertEqual(drm.DrmErrorCode.ERROR_UNKNOWN);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1100
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1100', 0, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(isSysSupport).assertTrue();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1200
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1200', 0, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
            expect(isSysSupport).assertTrue();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1300
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1300', 0, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW);
            if(sysSupport === true){
                expect(isSysSupport).assertTrue();
            } else {
                expect(isSysSupport).assertFalse();
            }
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1400
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,error uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1400', 1, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C", "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(isSysSupport).assertFalse();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1500
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,error mimetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1500', 1, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported(uuid, "1111/22222", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            if(sysSupport === true){
                expect(isSysSupport).assertFalse();
            } else {
                expect(isSysSupport).assertTrue();
            }
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1600
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,error securityLevel
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1600', 1, async (done:Function) => {
            let errCode = 0;
            try {
                let isSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4", 7);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_1400 isMediaKeySystemSupported err end", err.code);
                errCode = err.code;
            }
            expect(errCode).assertEqual(401);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1700
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,null uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1700', 1, async (done:Function) => {
            let errCode = 0;
            try {
                let isSysSupport = drm.isMediaKeySystemSupported("", "video/mp4",
                    drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_1500 isMediaKeySystemSupported err end", err.code);
                errCode = err.code;
            }
            expect(errCode).assertEqual(401);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1800
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,null mimetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1800', 1, (done:Function) => {
            let isSysSupport = drm.isMediaKeySystemSupported(uuid, "", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(isSysSupport).assertFalse();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1900
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 错误的安全等级，创建session异常用例
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1900', 0, async (done:Function) => {
            let errCode = 0;
            let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
            try {
                let drmMediaKeySession = drmMediaKeySystem.createMediaKeySession(5);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_1800 createMediaKeySession err end", err.code);
                errCode = err.code;
                drmMediaKeySystem.destroy();
            }
            expect(errCode).assertEqual(401);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2000
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码video/mp4
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2000', 0, (done:Function) => {
            let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
            let session = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(session).not();
            let result = session.requireSecureDecoderModule("video/avc");
            expect(result).assertFalse();
            let result1 = session.requireSecureDecoderModule("video/hevc");
            expect(result1).assertFalse();
            let result2 = session.requireSecureDecoderModule("video/avs3");
            expect(result2).assertFalse();
            session.destroy();
            drmMediaKeySystem.destroy();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2100
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码video/mp4
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2100', 0, (done:Function) => {
            let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
            let session = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
            expect(session).not();
            if(sysSupport === true){
                let result = session.requireSecureDecoderModule("video/avc");
                expect(result).assertFalse();
                let result1 = session.requireSecureDecoderModule("video/hevc");
                expect(result1).assertFalse();
                let result2 = session.requireSecureDecoderModule("video/avs3");
                expect(result2).assertFalse();
            } else {
                let result = session.requireSecureDecoderModule("video/avc");
                expect(result).assertTrue();
                let result1 = session.requireSecureDecoderModule("video/hevc");
                expect(result1).assertTrue();
                let result2 = session.requireSecureDecoderModule("video/avs3");
                expect(result2).assertTrue();
            }
            session.destroy();
            drmMediaKeySystem.destroy();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2200
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码hls/ts
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2200', 0, (done:Function) => {
            if(sysSupport === true) {
                let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
                let session = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
                let result = session.requireSecureDecoderModule("hls/ts");
                expect(result).assertFalse();
                session.destroy();
                drmMediaKeySystem.destroy();
            } else {
                let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
                let session = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
                try {
                    let result = session.requireSecureDecoderModule("hls/ts");
                } catch (err) {
                    console.log("XX DRM_FRAMEWORK_API_2200 requireSecureDecoderModule err end", err.code);
                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                }
                session.destroy();
                drmMediaKeySystem.destroy();
            }
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2300
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码,错误的minetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2300', 0, async (done:Function) => {
            let drmMediaKeySystem:drm.MediaKeySystem[] = [];
            let errCode = 0;
            for (let i = 0; i < 64; i++) {
                drmMediaKeySystem[i] = drm.createMediaKeySystem(uuid);
                expect(drmMediaKeySystem[i].getStatistics()).not();
            }
            try {
                let drmMediaKeySystem2 = drm.createMediaKeySystem(uuid);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2300 createMediaKeySystem2X err end", err.code);
                errCode = err.code;
                for (let j = 0; j < 64; j++) {
                    drmMediaKeySystem[j].destroy();
                }
            }
            expect(errCode).assertEqual(drm.DrmErrorCode.MAX_SYSTEM_NUM_REACHED);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2400
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码,错误的minetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2400', 0, async (done:Function) => {
            let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
            let sessionArray:drm.MediaKeySession[] = [];
            let errCode = 0;
            for (let i = 0; i < 64; i++) {
                sessionArray[i] = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                expect(sessionArray[i].getContentProtectionLevel()).not();
            }
            try {
                let session2 = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2400 createMediaKeySession err end", err.code);
                errCode = err.code;
                for (let j = 0; j < 64; j++) {
                    sessionArray[j].destroy();
                }
                drmMediaKeySystem.destroy();
            }
            expect(errCode).assertEqual(drm.DrmErrorCode.MAX_SESSION_NUM_REACHED);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2500
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 会话安全等级unknown默认为HW
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2500', 0, (done:Function) => {
            let errCode = 0;
            let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
            try{
                let session = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2600 createMediaKeySession err end", err.code);
                errCode = err.code;
                drmMediaKeySystem.destroy();
            }
            expect(errCode).assertEqual(401);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2600
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码video/mp4
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2600', 0, (done:Function) => {
            let errCode = 0;
            let drmMediaKeySystem = drm.createMediaKeySystem(uuid);
            try {
                let session =
                    drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2600 createMediaKeySession err end", err.code);
                errCode = err.code;
                drmMediaKeySystem.destroy();
            }
            expect(errCode).assertEqual(401);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取设备证书，传入错误的响应报文数据
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0100', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                drmsys.generateKeySystemRequest().then((drmRequest) => {
                    console.log("XX DRM_AVPLAYER_0100 generateKeySystemRequest success", drmRequest.data, drmRequest.defaultURL);
                    let arry = new Uint8Array([1, 2, 3, 4, 5]);
                    drmsys.processKeySystemResponse(arry).then(() => {
                        let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
                        expect(session).not();
                        session.destroy();
                        drmsys.destroy();
                        console.log("XX DRM_AVPLAYER_0100 processKeySystemResponse success");
                        done();
                    }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0100 processKeySystemResponse err end", err.code);
                    });
                }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_0100 generateKeySystemRequest err end", err.code);
                });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let cstatus = drmsys.getCertificateStatus();
                if(cstatus != drm.CertificateStatus.CERT_STATUS_PROVISIONED){
                    drmsys.generateKeySystemRequest().then((drmRequest) => {
                        console.log("XX DRM_AVPLAYER_0100 generateKeySystemRequest success", drmRequest.data, drmRequest.defaultURL);
                        let arry = new Uint8Array([1, 2, 3, 4, 5]);
                        drmsys.processKeySystemResponse(arry).then(() => {
                            let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
                            expect(session).not();
                            session.destroy();
                            drmsys.destroy();
                            console.log("XX DRM_AVPLAYER_0100 processKeySystemResponse success");
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_0100 processKeySystemResponse err end", err.code);
                        });
                    }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0100 generateKeySystemRequest err end", err.code);
                    });
                } else {
                    drmsys.destroy();
                    done();
                }
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取设备证书，响应报文数据为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0200', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                drmsys.generateKeySystemRequest().then((drmRequest) => {
                    console.log("XX DRM_AVPLAYER_0200 generateKeySystemRequest success", drmRequest.data, drmRequest.defaultURL);
                    drmsys.processKeySystemResponse(null).then(() => {
                        let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                        expect(session).not();
                        console.log("XX DRM_AVPLAYER_0200 processKeySystemResponse success");
                    }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0200 processKeySystemResponse err end", err.code);
                        expect(err.code).assertEqual(401);
                        drmsys.destroy();
                        done();
                    });
                }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_0200 generateKeySystemRequest err end", err.code);
                });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let cstatus = drmsys.getCertificateStatus();
                if(cstatus != drm.CertificateStatus.CERT_STATUS_PROVISIONED){
                    drmsys.generateKeySystemRequest().then((drmRequest) => {
                        console.log("XX DRM_AVPLAYER_0200 generateKeySystemRequest success", drmRequest.data, drmRequest.defaultURL);
                        drmsys.processKeySystemResponse(null).then(() => {
                            let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                            expect(session).not();
                            console.log("XX DRM_AVPLAYER_0200 processKeySystemResponse success");
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_0200 processKeySystemResponse err end", err.code);
                            expect(err.code).assertEqual(401);
                            drmsys.destroy();
                            done();
                        });
                    }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0200 generateKeySystemRequest err end", err.code);
                    });
                } else {
                    drmsys.destroy();
                    done();
                }
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取设备证书，正常参数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0300', 0, (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let cstatus = drmsys.getCertificateStatus();
            console.log("XX DRM_AVPLAYER_0300 cstatus is ",cstatus)
            if(cstatus != drm.CertificateStatus.CERT_STATUS_PROVISIONED){
                drmsys.generateKeySystemRequest().then(async (drmRequest) => {
                    console.info("XX DRM_AVPLAYER_0300 success", drmRequest.data ,drmRequest.defaultURL);
                    let provisionRequestStr = byteToString(drmRequest.data);
                    let provisionResponseStr = await getHttpData(drmRequest.defaultURL, provisionRequestStr);
                    let provisionResponseByte = stringToUint8Array(provisionResponseStr);
                    drmsys.processKeySystemResponse(provisionResponseByte).then(() => {
                        let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
                        expect(session).not();
                        session.destroy();
                        drmsys.destroy();
                        console.info("XX DRM_AVPLAYER_0300 processKeySystemResponse success");
                        done();
                    }).catch((err:BusinessError) =>{
                        console.info("XX DRM_AVPLAYER_0300 processKeySystemResponse err end", err.code);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX DRM_AVPLAYER_0300 generateKeySystemRequest err end", err.code);
                });
            } else {
                drmsys.destroy();
                done();
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0400
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,正常参数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0400', 0, async (done:Function) => {
            if (sysSupport === true) {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4",uint8pssh,drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then((DrmRequest) => {
                    console.log("XX DRM_AVPLAYER_0300 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    let responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                    session.processMediaKeyResponse(responseArray).then((keyId) => {
                        let keyvalue = session.checkMediaKeyStatus();
                        expect(keyvalue[0].value).assertEqual('MediaKey is OK');
                        session.destroy();
                        drmsys.destroy();
                        console.log("XX DRM_AVPLAYER_0300 processMediaKeyResponse success ",keyvalue[0].value);
                        done();
                    }).catch((err:BusinessError) =>{
                        console.log("XX DRM_AVPLAYER_0300 processMediaKeyResponse err end", err.code);
                    });
                }).catch((err:BusinessError) =>{
                    console.log("XX DRM_AVPLAYER_0300 generateMediaKeyRequest err end", err.code);
                });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4",uint8pssh,drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (licenseRequestData) => {
                    console.info("XX DRM_AVPLAYER_0400 generateMediaKeyRequest success",licenseRequestData.mediaKeyRequestType,licenseRequestData.data,licenseRequestData.defaultURL);
                    let licenseRequestStr = byteToString(licenseRequestData.data);
                    let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense", licenseRequestStr);
                    console.info("XX DRM_AVPLAYER_0400 licenseResponseStr success", licenseResponseStr);
                    let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    session.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                        let keyvalue = session.checkMediaKeyStatus();
                        for(let i = 0; i<keyvalue.length; i++){
                            if(keyvalue[i].name === 'LicenseType'){
                                expect(keyvalue[i].value).assertEqual('Streaming');
                            }
                        }
                        session.destroy();
                        drmsys.destroy();
                        console.info("XX DRM_AVPLAYER_0400 processMediaKeyResponse success ",keyvalue[0].value);
                        done();
                    }).catch((err:BusinessError) =>{
                        console.info("XX DRM_AVPLAYER_0400 processMediaKeyResponse err end", err.code);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX DRM_AVPLAYER_0400 generateMediaKeyRequest err end", err.code);
                });
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0500
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求minetype异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0500', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("1111/2222", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then((DrmRequest) => {
                    console.log("XX DRM_AVPLAYER_0500 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                        DrmRequest.data, DrmRequest.defaultURL);
                }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_0500 generateMediaKeyRequest err end", err.code);
                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                    session.destroy();
                    drmsys.destroy();
                    done();
                });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("1111/2222", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then((DrmRequest) => {
                    console.log("XX DRM_AVPLAYER_0500 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType, DrmRequest.data, DrmRequest.defaultURL);
                    session.destroy();
                    drmsys.destroy();
                    done();
                }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_0500 generateMediaKeyRequest err end", err.code);
                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求minetype为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0600', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest(null, uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_0600 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0600 generateMediaKeyRequest err end", err.code);
                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest(null, uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_0600 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0600 generateMediaKeyRequest err end", err.code);
                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                    });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求初始数据异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0700', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q=');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_0700 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0700 generateMediaKeyRequest err end", err.code);
                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q=');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_0700 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0700 generateMediaKeyRequest err end", err.code);
                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                    });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求初始数据为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0800', 0, async (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];
            session.generateMediaKeyRequest("video/mp4", null, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then((DrmRequest) => {
                console.log("XX DRM_AVPLAYER_0800 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
            }).catch((err:BusinessError) =>{
                console.log("XX DRM_AVPLAYER_0800 generateMediaKeyRequest err end", err.code);
                expect(err.code).assertEqual(401);
                session.destroy();
                drmsys.destroy();
                done();
            });
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0900
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求的licensetype异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0900', 0, async (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            let base64 = new util.Base64();
            let uint8pssh =
                base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];
            session.generateMediaKeyRequest("video/mp4", uint8pssh, 3, optionalData).then((DrmRequest) => {
                console.log("XX DRM_AVPLAYER_0900 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                    DrmRequest.data, DrmRequest.defaultURL);
            }).catch((err:BusinessError) => {
                console.log("XX DRM_AVPLAYER_0900 generateMediaKeyRequest err end", err.code);
                expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                session.destroy();
                drmsys.destroy();
                done();
            });
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1000
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,响应报文异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1000', 0, async (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            let base64 = new util.Base64();
            let uint8pssh =
                base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];
            session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                .then((DrmRequest) => {
                    console.log("XX DRM_AVPLAYER_1000 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                        DrmRequest.data, DrmRequest.defaultURL);
                    let responseArray = new Uint8Array([1, 2, 3, 4, 5]);
                    session.processMediaKeyResponse(responseArray).then((keyId) => {
                        console.log("XX DRM_AVPLAYER_1000 processMediaKeyresponse success", keyId);
                        let keyvalue = session.checkMediaKeyStatus();
                    }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1000 processMediaKeyResponse err end", err.code);
                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    });
                })
                .catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_1000 generateMediaKeyRequest err end", err.code);
                });
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,正常删除许可证信息，正常检查许可证状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1100', 0, async (done:Function) => {
            if(sysSupport === true){
                let errCode = 0;
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyvalue = session.checkMediaKeyStatus();
                            console.log("XX DRM_AVPLAYER_1100 keyvalue", keyvalue[0].value);
                            expect(keyvalue[0].value).assertEqual('MediaKey is OK');
                            session.clearMediaKeys();
                            console.log("XX DRM_AVPLAYER_1100 clearMediaKeys");
                            try {
                                let keyvalue2 = session.checkMediaKeyStatus();
                            } catch (err) {
                                console.log("XX SESSION_ON_OFF_1000 generateKeySystemRequest err end", err);
                                errCode = err.code;
                            }
                            expect(errCode).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                            session.destroy();
                            drmsys.destroy();
                            console.log("XX DRM_AVPLAYER_1100 processMediaKeyResponse success", keyId);
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1100 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1100 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then(async (DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let licenseRequestStr = byteToString(DrmRequest.data);
                        let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense", licenseRequestStr);
                        let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                        session.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                            let keyvalue = session.checkMediaKeyStatus();
                            for(let i = 0; i<keyvalue.length; i++){
                                if(keyvalue[i].name === 'LicenseType'){
                                    expect(keyvalue[i].value).assertEqual('Streaming');
                                }
                            }
                            session.clearMediaKeys();
                            let keyvalue2 = session.checkMediaKeyStatus();
                            for(let i = 0; i<keyvalue2.length; i++){
                                expect(keyvalue2[i].value).not();
                            }
                            session.destroy();
                            drmsys.destroy();
                            console.log("XX DRM_AVPLAYER_1100 processMediaKeyResponse success", keyId);
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1100 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1100 generateMediaKeyRequest err end", err.code);
                    });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，获取离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1200', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1200 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            console.log("keyIds is", keyIds);
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            session.destroy();
                            drmsys.destroy();
                            console.log("XX DRM_AVPLAYER_1200 processMediaKeyResponse success", keyId);
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1200 generateMediaKeyRequest err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1200 processMediaKeyResponse err end", err.code);
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then(async (DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1200 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let licenseRequestStr = byteToString(DrmRequest.data);
                        let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense", licenseRequestStr);
                        let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                        session.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            console.log("keyIds is", keyIds);
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            session.destroy();
                            drmsys.destroy();
                            console.log("XX DRM_AVPLAYER_1200 processMediaKeyResponse success", keyId);
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1200 generateMediaKeyRequest err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1200 processMediaKeyResponse err end", err.code);
                    });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1300', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1300 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            drmsys.clearOfflineMediaKeys(arry);
                            OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
                            session.destroy();
                            drmsys.destroy();
                            console.log("XX DRM_AVPLAYER_1300 processMediaKeyResponse success");
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1300 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1300 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData).then(async (DrmRequest) => {
                    console.log("XX DRM_AVPLAYER_1300 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType, DrmRequest.data, DrmRequest.defaultURL);
                    let licenseRequestStr = byteToString(DrmRequest.data);
                    let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense", licenseRequestStr);
                    let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    session.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                        let keyIds = drmsys.getOfflineMediaKeyIds();
                        let arry = new Uint8Array(keyIds[0]);
                        let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                        console.log("XX DRM_AVPLAYER_1300 OfflineKeyState is", OfflineKeyState);
                        expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                        drmsys.clearOfflineMediaKeys(arry);
                        OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                    }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1300 processMediaKeyResponse err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    });
                }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_1300 generateMediaKeyRequest err end", err.code);
                });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1400
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，无效离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1400', 0, (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let arry = new Uint8Array([1, 2, 3, 4, 5]);
                let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
                drmsys.destroy();
                done();
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let arry = new Uint8Array([1, 2, 3, 4, 5]);
                try {
                    let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                }catch (err) {
                    console.log("XX DRM_AVPLAYER_1400 getOfflineMediaKeyStatus err end", err.code);
                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                    drmsys.destroy();
                    done();
                }
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线许可证，错误参数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1600', 0, async (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            try {
                drmsys.clearOfflineMediaKeys(new Uint8Array([1, 2, 3, 4, 5]));
            } catch(err) {
                console.log("XX DRM_AVPLAYER_1600 clearOfflineMediaKeys err end", err.code);
                expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                drmsys.destroy();
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线许可证，参数为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1700', 0, async (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            try {
                drmsys.clearOfflineMediaKeys(null);
            } catch(err) {
                console.log("XX DRM_AVPLAYER_1700 clearOfflineMediaKeys err end", err.code);
                expect(err.code).assertEqual(401);
                drmsys.destroy();
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，重复删除离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1800', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1800 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            drmsys.clearOfflineMediaKeys(arry);
                            OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
                            drmsys.clearOfflineMediaKeys(arry);
                            console.log("XX DRM_AVPLAYER_1800 processMediaKeyResponse success");
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1800 processMediaKeyResponse err end", err.code);
                            expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                            session.destroy();
                            drmsys.destroy();
                            done();
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1800 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then(async (DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1800 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let licenseRequestStr = byteToString(DrmRequest.data);
                        let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense", licenseRequestStr);
                        let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                        session.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            drmsys.clearOfflineMediaKeys(arry);
                            OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1800 processMediaKeyResponse err end", err.code);
                            expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                            session.destroy();
                            drmsys.destroy();
                            done();
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1800 generateMediaKeyRequest err end", err.code);
                    });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1900
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，正常传参
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1900', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1900 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let keyArray = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            session.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                console.log("XX DRM_AVPLAYER_1900 generateOfflineReleaseRequest end", OfflineReleaseRequest);
                                session.processOfflineReleaseResponse(keyArray, responseArray).then(() => {
                                    OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                                    expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                                    session.destroy();
                                    drmsys.destroy();
                                    console.log("XX DRM_AVPLAYER_1900 processOfflineReleaseResponse success");
                                    console.log("XX DRM_AVPLAYER_1900 processMediaKeyResponse success");
                                    done();
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_1900 processOfflineReleaseResponse err end", err.code);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_1900 generateOfflineReleaseRequest err end", err.code);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1900 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1900 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2000
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，请求参数异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2000', 0, async (done:Function) => {
            if (sysSupport === true) {
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_2000 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType, DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState)
                                .assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            let keyArray = new Uint8Array([1, 2, 3, 4, 5]);
                            session.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                console.log("XX DRM_AVPLAYER_2000 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                session.processOfflineReleaseResponse(keyArray, responseArray).then(() => {
                                    OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_2000 processOfflineReleaseResponse err end", err.code);
                                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_2000 generateOfflineReleaseRequest err end", err.code);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_2000 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_2000 generateMediaKeyRequest err end", err.code);
                    });
            }
            else {
                done();
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，请求参数为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2100', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_2100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            session.generateOfflineReleaseRequest(null).then((OfflineReleaseRequest) => {
                                console.log("XX DRM_AVPLAYER_2100 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_2100 generateOfflineReleaseRequest err end", err.code);
                                expect(err.code).assertEqual(401);
                                session.destroy();
                                drmsys.destroy();
                                done();
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_2100 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_2100 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常licenseid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2200', 0, async (done:Function) => {
            if (sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_2200 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let keyArray = new Uint8Array(keyIds[0]);
                            session.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                console.log("XX DRM_AVPLAYER_2200 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                session.processOfflineReleaseResponse(new Uint8Array([1, 2, 3, 4, 5]), responseArray).then(() => {
                                    console.log("XX DRM_AVPLAYER_2200 processOfflineReleaseResponse success");
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_2200 processOfflineReleaseResponse err end", err.code);
                                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_2200 generateOfflineReleaseRequest err end", err.code);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_2200 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_2200 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常响应报文
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2300', 0, async (done:Function) => {
            if (sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_2300 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            console.log("XX DRM_AVPLAYER_2300 processMediaKeyResponse success");
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let keyArray = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            session.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                console.log("XX DRM_AVPLAYER_2300 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                session.processOfflineReleaseResponse(keyArray, new Uint8Array([1, 2, 3, 4, 5])).then(() => {
                                    OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                                    expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                                    session.destroy();
                                    drmsys.destroy();
                                    console.log("XX DRM_AVPLAYER_2300 processOfflineReleaseResponse success");
                                    console.log("XX DRM_AVPLAYER_2300 processMediaKeyResponse success");
                                    done();
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_2300 processOfflineReleaseResponse err end", err.code);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_2300 generateOfflineReleaseRequest err end", err.code);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_2300 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_2300 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2400
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常响应报文为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2400', 0, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_2400 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let keyArray = new Uint8Array(keyIds[0]);
                            session.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                console.log("XX DRM_AVPLAYER_2400 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                session.processOfflineReleaseResponse(keyArray, null).then(() => {
                                    console.log("XX DRM_AVPLAYER_2400 processOfflineReleaseResponse success");
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_2400 processOfflineReleaseResponse err end", err.code);
                                    expect(err.code).assertEqual(401);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_2400 generateOfflineReleaseRequest err end", err.code);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_2400 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_2400 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2500
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证restore,传错误的licenseid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2500', 0, (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            session.restoreOfflineMediaKeys(new Uint8Array([1, 2, 3, 4, 5])).then(() => {
                console.log("XX DRM_AVPLAYER_2500 restoreOfflineMediaKeys success");
            }).catch((err:BusinessError) => {
                console.log("XX DRM_AVPLAYER_2500 restoreOfflineMediaKeys err end", err.code);
                expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                session.destroy();
                drmsys.destroy();
                done();
            });
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证restore,licenseid为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2600', 0, (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            session.restoreOfflineMediaKeys(null).then(() => {
                console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_2600 restoreOfflineMediaKeys success");
            }).catch((err:BusinessError) => {
                console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_2600 restoreOfflineMediaKeys err end", err.code);
                expect(err.code).assertEqual(401);
                session.destroy();
                drmsys.destroy();
                done();
            });
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 设备证书状态查询
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2700', 0, (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let cstatus = drmsys.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
            drmsys.destroy();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 创建system1，获取设备证书，创建system2，检查设备证书状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2800', 0, (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let cstatus = drmsys.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
            let drmsys2 = drm.createMediaKeySystem(uuid);
            drmsys2.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
            drmsys.destroy();
            drmsys2.destroy();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2900
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 创建system1，获取设备证书，释放system1，创建system2，检查设备证书状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2900', 0, (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let cstatus = drmsys.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
            drmsys.destroy();
            let drmsys2 = drm.createMediaKeySystem(uuid);
            drmsys2.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
            drmsys2.destroy();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3000
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取插件name以及uuid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_3000', 0, (done:Function) => {
            if(sysSupport === true){
                let MediaKeySystemDescription = drm.getMediaKeySystems();
                for (let i = 0; i < MediaKeySystemDescription.length; i++) {
                    console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_3000 name is ", MediaKeySystemDescription[i].name);
                    console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_3000 uuid is ", MediaKeySystemDescription[i].uuid);
                    expect(MediaKeySystemDescription[i].name).assertEqual("com.clearplay.drm");
                    expect(MediaKeySystemDescription[i].uuid).assertEqual("47a10ff0ca3c49c69c12a764ffde091f");
                }
                done();
            } else {
                let MediaKeySystemDescription = drm.getMediaKeySystems();
                for (let i = 0; i < MediaKeySystemDescription.length; i++) {
                    console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_3000 name is ", MediaKeySystemDescription[i].name);
                    console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_3000 uuid is ", MediaKeySystemDescription[i].uuid);
                    expect(MediaKeySystemDescription[i].name).assertEqual("com.wiseplay.drm");
                    expect(MediaKeySystemDescription[i].uuid).assertEqual("3d5e6d359b9a41e8b843dd3c6e72c42c");
                }
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取插件最大安全等级
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_3100', 0, (done:Function) => {
            let drmsys = drm.createMediaKeySystem(uuid);
            let drmMaxLevel = drmsys.getMaxContentProtectionLevel();
            console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_3100 level is ", drmMaxLevel);
            if(sysSupport === true){
                expect(drmMaxLevel).assertEqual(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            }
            drmsys.destroy();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取插件name以及uuid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_3200', 0, (done:Function) => {
            if (sysSupport === true){
                let drmUuid = drm.getMediaKeySystemUuid("com.clearplay.drm");
                console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_3200 uuid is ", drmUuid);
                expect(drmUuid).assertEqual("47a10ff0ca3c49c69c12a764ffde091f");
                done();
            } else {
                let drmUuid = drm.getMediaKeySystemUuid("com.wiseplay.drm");
                console.log("XX SUB_MULTIMEDIA_DRM_AVPLAYER_3200 uuid is ", drmUuid);
                expect(drmUuid).assertEqual("3d5e6d359b9a41e8b843dd3c6e72c42c");
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0100
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值然后获取属性值
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0100', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, "ABC");
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).assertEqual("ABC");
                mediaKeySystem.destroy();
            } else {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).not();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0300
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值，输入错误的propertyName
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0300', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString("version_id", "1.1");
                let getCfg = mediaKeySystem.getConfigurationString("version_id");
                expect(getCfg).assertEqual("1.1");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋两次值，看最终结果是否覆盖
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0500', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, 'ABC');
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).assertEqual('ABC');
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, 'EFGH');
                getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).assertEqual('EFGH');
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0600
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0600', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION, "1.1");
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                expect(getCfg).assertEqual("1.1");
                mediaKeySystem.destroy();
            } else {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                expect(getCfg).not();
                mediaKeySystem.destroy();
                done();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0800
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0800', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION, "Test Set Get Config");
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                expect(getCfg).assertEqual("Test Set Get Config");
                mediaKeySystem.destroy();
            } else {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                expect(getCfg).assertEqual("WisePlay DRM");
                mediaKeySystem.destroy();
                done();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1000
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1000', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS, "AES");
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                expect(getCfg).assertEqual("AES");
                mediaKeySystem.destroy();
            } else {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                expect(getCfg).assertEqual("AES/CBC/NoPadding,AES/CTR/NoPadding,SM4/CBC/NoPadding");
                mediaKeySystem.destroy();
                done();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1100
        * @tc.name      : testSet_get_config
        * @tc.desc      : get systemid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1100', 1, (done:Function) => {
            if (sysSupport === false) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let getCfg = mediaKeySystem.getConfigurationString("systemId");
                console.info("XX SET_GET_CONFIG_1100 getCfg is",getCfg)
                expect(getCfg).assertEqual("3d5e6d35-9b9a-41e8-b843-dd3c6e72c42c");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1200
        * @tc.name      : testSet_get_config
        * @tc.desc      : get deviceUniqueId
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1200', 1, (done:Function) => {
            if (sysSupport === false) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let getCfg = mediaKeySystem.getConfigurationByteArray('deviceUniqueId');
                console.info("XX SET_GET_CONFIG_1200 getCfg is",getCfg);
                let getCfgString = byteToString(getCfg);
                console.info("XX SET_GET_CONFIG_1200 getCfgString is",getCfgString);
                expect(getCfg).not();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1300
        * @tc.name      : testSet_get_config
        * @tc.desc      : 查询最大会话数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1300', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                try {
                    let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                } catch (err) {
                    console.log("XX DRM_SET_GET_CONFIG_1300 getConfigurationString err end", err.code);
                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                    mediaKeySystem.destroy();
                }
            } else {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertEqual("64");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1400
        * @tc.name      : testGetMetric
        * @tc.desc      : get metric information
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1400', 1, (done:Function) => {
            let mediaKeySystem = drm.createMediaKeySystem(uuid);
            let sessionArray:drm.MediaKeySession[] = [];
            let metric = mediaKeySystem.getStatistics();
            for (let item of metric) {
                console.log("XX TEST metric" + item.name + ':' + item.value);
                if (item.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                    expect(item.value).assertEqual('0');
                }
            }
            for (let i = 0; i < 64; i++) {
                sessionArray[i] = mediaKeySystem.createMediaKeySession();
            }
            let metric2 = mediaKeySystem.getStatistics();
            for (let item2 of metric2) {
                console.log("XX TEST metric2" + item2.name + ':' + item2.value);
                if (item2.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                    expect(item2.value).assertEqual('64');
                }
            }
            for (let j = 0; j < 32; j++) {
                sessionArray[j].destroy();
            }
            let metric3 = mediaKeySystem.getStatistics();
            for (let item3 of metric3) {
                console.log("XX TEST metric3" + item3.name + ':' + item3.value);
                if (item3.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                    expect(item3.value).assertEqual('32');
                }
            }
            for (let k = 32; k < 64; k++) {
                sessionArray[k].destroy();
            }
            mediaKeySystem.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1500
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值然后获取属性值(Uint8array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1500', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("ABC");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1600
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值，输入错误的propertyName(Uint8Array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1600', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("ABC");
                mediaKeySystem.setConfigurationByteArray("version_id", valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray("version_id");
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1700
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋两次值，看最终结果是否覆盖(Uint8Array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1700', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("ABC");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                valueArray = stringToUint8Array("EFG");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1800
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1800', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("1.1");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION, valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1900
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1900', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("Test Set Get Config");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION, valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2000
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2000', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("AES");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS, valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2100
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2100', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("7E8G9D");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID, valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2200
        * @tc.name      : testSet_get_config
        * @tc.desc      : 设置最大会话数为0
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2200', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("0");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2300
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给maxSessionNum赋值，超过默认最大数64
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2300', 1, (done:Function) => {
            if (sysSupport === true) {
                let mediaKeySystem = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("65");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                let getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2400
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给maxSessionNum赋值1，创建两个会话
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2400', 1, (done:Function) => {
            if (sysSupport === true) {
                let drmsys = drm.createMediaKeySystem(uuid);
                let valueArray = stringToUint8Array("1");
                drmsys.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                let getCfg = drmsys.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                for (let i = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let session = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                expect(session).not();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0100
        * @tc.name      : test_on_off_interface_0100
        * @tc.desc      : keyNeeded on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0100', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keyRequired', (eventInfo) => {
                    console.info('bbbbb receive keyRequired ' + eventInfo.info);
                    console.info('bbbbb receive keyRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX SESSION_ON_OFF_0100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            expect(sign).assertEqual(2);
                            keySession.off('keyRequired');
                            keySession.destroy();
                            drmsys.destroy();
                            console.log("XX SESSION_ON_OFF_0100 keyRequired success");
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0100 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0100 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keyRequired', (eventInfo) => {
                    console.info('bbbbb receive keyRequired ' + eventInfo.info);
                    console.info('bbbbb receive keyRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                console.info("XX SESSION_ON_OFF_0100 pssh is",uint8pssh)
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (DrmRequest) => {
                    console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    let licenseRequestStr = byteToString(DrmRequest.data);
                    let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                    let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    keySession.processMediaKeyResponse(licenseResponseByte).then(async (keyId) => {
                        console.info("XX SESSION_ON_OFF_0100 is ",sign)
                        console.info("XX SESSION_ON_OFF_0100 keyRequired success");
                        await sleep(30000);
                        keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (DrmRequest) => {
                            console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest 2 success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                            let licenseRequestStr = byteToString(DrmRequest.data);
                            let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                            let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                            keySession.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                                console.info("XX SESSION_ON_OFF_0100 2 is ",sign)
                                expect(sign).assertEqual(2);
                                keySession.off('keyRequired');
                                keySession.destroy();
                                drmsys.destroy();
                                console.info("XX SESSION_ON_OFF_0100 keyRequired 2 success");
                                done();
                            }).catch((err:BusinessError) =>{
                                console.info("XX SESSION_ON_OFF_0100 processMediaKeyResponse err end1", err.code);
                            });
                        }).catch((err:BusinessError) =>{
                            console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest err end", err.code);
                        });
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0100 processMediaKeyResponse err end1", err.code);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest err end", err.code);
                });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0200
        * @tc.name      : test_on_off_interface_0200
        * @tc.desc      : keyNeeded on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0200', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keyRequired', (eventInfo) => {
                    console.info('bbbbb receive keyRequired ' + eventInfo.info);
                    console.info('bbbbb receive keyRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                keySession.off('keyRequired');
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX SESSION_ON_OFF_0200 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            expect(sign).assertEqual(1);
                            keySession.destroy();
                            drmsys.destroy();
                            console.log("XX SESSION_ON_OFF_0200 keyRequired success");
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0200 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0200 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keyRequired', (eventInfo) => {
                    console.info('bbbbb receive keyRequired ' + eventInfo.info);
                    console.info('bbbbb receive keyRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                keySession.off('keyRequired');
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                console.info("XX SESSION_ON_OFF_0100 pssh is",uint8pssh)
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (DrmRequest) => {
                    console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    let licenseRequestStr = byteToString(DrmRequest.data);
                    let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                    let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    keySession.processMediaKeyResponse(licenseResponseByte).then(async (keyId) => {
                        console.info("XX SESSION_ON_OFF_0100 is ",sign)
                        console.info("XX SESSION_ON_OFF_0100 keyRequired success");
                        await sleep(30000);
                        keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (DrmRequest) => {
                            console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                            let licenseRequestStr = byteToString(DrmRequest.data);
                            let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                            let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                            keySession.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                                console.info("XX SESSION_ON_OFF_0100 is ",sign)
                                expect(sign).assertEqual(1);
                                keySession.destroy();
                                drmsys.destroy();
                                console.info("XX SESSION_ON_OFF_0100 keyRequired success");
                                done();
                            }).catch((err:BusinessError) =>{
                                console.info("XX SESSION_ON_OFF_0100 processMediaKeyResponse err end1", err.code);
                            });
                        }).catch((err:BusinessError) =>{
                            console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest err end", err.code);
                        });
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0100 processMediaKeyResponse err end1", err.code);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest err end", err.code);
                });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0300
        * @tc.name      : test_on_off_interface_0300
        * @tc.desc      : keyExpired on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0300', 1, (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keyExpired', (eventInfo) => {
                    console.info('bbbbb receive keyExpired ' + eventInfo.info);
                    console.info('bbbbb receive keyExpired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX SESSION_ON_OFF_0300 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            keySession.clearMediaKeys();
                            keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                                expect(sign).assertEqual(2);
                                keySession.off('keyExpired');
                                keySession.destroy();
                                drmsys.destroy();
                                console.log("XX SESSION_ON_OFF_0300 keyExpired success");
                                done();
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0300 processMediaKeyResponse err end", err.code);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0300 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0300 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0400
        * @tc.name      : test_on_off_interface_0400
        * @tc.desc      : keyExpired on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0400', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keyExpired', (eventInfo) => {
                    console.info('bbbbb receive keyExpired ' + eventInfo.info);
                    console.info('bbbbb receive keyExpired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                keySession.off('keyExpired');
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX SESSION_ON_OFF_0400 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            keySession.clearMediaKeys();
                            keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                                expect(sign).assertEqual(1);
                                keySession.destroy();
                                drmsys.destroy();
                                console.log("XX SESSION_ON_OFF_0400 keyExpired success");
                                done();
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0400 processMediaKeyResponse err end", err.code);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0400 processMediaKeyResponse err end", err.code);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0400 generateMediaKeyRequest err end", err.code);
                    });
            } else {
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0500
        * @tc.name      : test_on_off_interface_0500
        * @tc.desc      : expirationUpdate on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0500', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('expirationUpdate', (eventInfo) => {
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.info);
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.extraInfo);
                    sign = 2;
                });
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData).then((DrmRequest) => {
                    console.log("XX SESSION_ON_OFF_0500 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    let responseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                    keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                        let keyIds = drmsys.getOfflineMediaKeyIds();
                        let keyArray = new Uint8Array(keyIds[0]);
                        let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                        expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                        keySession.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                            console.log("XX SESSION_ON_OFF_0500 generateOfflineReleaseRequest end", OfflineReleaseRequest);
                            keySession.processOfflineReleaseResponse(keyArray, responseArray).then(() => {
                                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                                keySession.restoreOfflineMediaKeys(keyArray).then(() => {
                                    expect(sign).assertEqual(2);
                                    keySession.off('expirationUpdate');
                                    keySession.destroy();
                                    drmsys.destroy();
                                    console.log("XX SESSION_ON_OFF_0500 expirationUpdate success");
                                    done();
                                }).catch((err:BusinessError) =>{
                                    console.log("XX SESSION_ON_OFF_0500 restoreOfflineMediaKeys err end", err.code);
                                });
                            }).catch((err:BusinessError) =>{
                                console.log("XX SESSION_ON_OFF_0500 processOfflineReleaseResponse err end", err.code);
                            });
                        }).catch((err:BusinessError) =>{
                            console.log("XX SESSION_ON_OFF_0500 generateOfflineReleaseRequest err end", err.code);
                        });
                    }).catch((err:BusinessError) =>{
                        console.log("XX SESSION_ON_OFF_0500 processMediaKeyResponse err end", err.code);
                    });
                }).catch((err:BusinessError) =>{
                    console.log("XX SESSION_ON_OFF_0500 generateMediaKeyRequest err end", err.code);
                });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('expirationUpdate', (eventInfo) => {
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.info);
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.extraInfo);
                    sign = 2;
                });
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData).then(async (DrmRequest) => {
                    console.info("XX SESSION_ON_OFF_0500 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    let licenseRequestStr = byteToString(DrmRequest.data);
                    let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                    let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    keySession.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                        console.info("XX SESSION_ON_OFF_0500 expirationUpdate sign is ",sign);
                        expect(sign).assertEqual(2);
                        keySession.off('expirationUpdate');
                        keySession.destroy();
                        drmsys.destroy();
                        console.info("XX SESSION_ON_OFF_0500 expirationUpdate success");
                        done();
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0500 processMediaKeyResponse err end", err.code);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX SESSION_ON_OFF_0500 generateMediaKeyRequest err end", err.code);
                });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0600
        * @tc.name      : test_on_off_interface_0600
        * @tc.desc      : expirationUpdate on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0600', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('expirationUpdate', (eventInfo) => {
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.info);
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.extraInfo);
                    sign = 2;
                });
                keySession.off('expirationUpdate');
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE,
                    optionalData).then((DrmRequest) => {
                    console.log("XX DRM_AVPLAYER_1900 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                        DrmRequest.data, DrmRequest.defaultURL);
                    let responseArray =
                        new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                            0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                            0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                            0x3D]);
                    keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                        let keyIds = drmsys.getOfflineMediaKeyIds();
                        let keyArray = new Uint8Array(keyIds[0]);
                        let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                        expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                        keySession.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                            console.log("XX SESSION_ON_OFF_0600 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                            keySession.processOfflineReleaseResponse(keyArray, responseArray).then(() => {
                                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                                keySession.restoreOfflineMediaKeys(keyArray).then(() => {
                                    expect(sign).assertEqual(1);
                                    keySession.destroy();
                                    drmsys.destroy();
                                    console.log("XX SESSION_ON_OFF_0600 expirationUpdate success");
                                    done();
                                }).catch((err:BusinessError) => {
                                    console.log("XX SESSION_ON_OFF_0600 restoreOfflineMediaKeys err end", err.code);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0600 processOfflineReleaseResponse err end", err.code);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0600 generateOfflineReleaseRequest err end", err.code);
                        });
                    }).catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0600 processMediaKeyResponse err end", err.code);
                    });
                }).catch((err:BusinessError) => {
                    console.log("XX SESSION_ON_OFF_0600 generateMediaKeyRequest err end", err.code);
                });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('expirationUpdate', (eventInfo) => {
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.info);
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.extraInfo);
                    sign = 2;
                });
                keySession.off('expirationUpdate');
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData).then(async (DrmRequest) => {
                    console.info("XX SESSION_ON_OFF_0600 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    let licenseRequestStr = byteToString(DrmRequest.data);
                    let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                    let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    keySession.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                        console.info("XX SESSION_ON_OFF_0600 expirationUpdate sign is ",sign);
                        expect(sign).assertEqual(1);
                        keySession.destroy();
                        drmsys.destroy();
                        console.info("XX SESSION_ON_OFF_0600 expirationUpdate success");
                        done();
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0600 processMediaKeyResponse err end", err.code);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX SESSION_ON_OFF_0600 generateMediaKeyRequest err end", err.code);
                });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0700
        * @tc.name      : test_on_off_interface_0700
        * @tc.desc      : keyChanged on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0700', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keysChange', (keyInfo, newKeyAvailable) => {
                    console.info('bbbbb receive keysChange newKeyAvailable:' + newKeyAvailable);
                    for (let index = 0; index < keyInfo.length; index++) {
                        console.info('bbbbb receive keysChange index:' + index);
                        console.info('bbbbb receive keysChange keyId:' + keyInfo[index].keyId);
                        console.info('bbbbb receive keysChange value:' + keyInfo[index].value);
                    }
                    sign = 2;
                });
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        let responseArray =
                            new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A,
                                0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,
                                0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D,
                                0x3D]);
                        let responseArray2 =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse success");
                            keySession.processMediaKeyResponse(responseArray2).then((keyId) => {
                                expect(sign).assertEqual(2);
                                keySession.off('keysChange');
                                keySession.destroy();
                                drmsys.destroy();
                                console.log("XX SESSION_ON_OFF_0700 keysChange success");
                                done();
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keysChange', (keyInfo, newKeyAvailable) => {
                    console.info('bbbbb receive keysChange newKeyAvailable:' + newKeyAvailable);
                    for (let index = 0; index < keyInfo.length; index++){
                        console.info('bbbbb receive keysChange index:' + index);
                        console.info('bbbbb receive keysChange keyId:' + keyInfo[index].keyId);
                        console.info('bbbbb receive keysChange value:' + keyInfo[index].value);
                    }
                    sign = 2;
                });
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (DrmRequest) => {
                    let licenseRequestStr = byteToString(DrmRequest.data);
                    let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                    let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    let licenseResponseByte2 = stringToUint8Array(licenseResponseStr);
                    keySession.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                        console.info("XX SESSION_ON_OFF_0700 processMediaKeyResponse success");
                        keySession.processMediaKeyResponse(licenseResponseByte2).then((keyId) => {
                            console.info("XX SESSION_ON_OFF_0700 keysChange sign is ",sign);
                            expect(sign).assertEqual(2);
                            keySession.off('keysChange');
                            keySession.destroy();
                            drmsys.destroy();
                            console.info("XX SESSION_ON_OFF_0700 keysChange success");
                            done();
                        }).catch((err:BusinessError) =>{
                            console.info("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                        });
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0800
        * @tc.name      : test_on_off_interface_0800
        * @tc.desc      : keyChanged on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0800', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keysChange', (keyInfo, newKeyAvailable) => {
                    console.info('bbbbb receive keysChange newKeyAvailable:' + newKeyAvailable);
                    for (let index = 0; index < keyInfo.length; index++) {
                        console.info('bbbbb receive keysChange index:' + index);
                        console.info('bbbbb receive keysChange keyId:' + keyInfo[index].keyId);
                        console.info('bbbbb receive keysChange value:' + keyInfo[index].value);
                    }
                    sign = 2;
                });
                keySession.off('keysChange');
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        let responseArray =
                            new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A,
                                0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,
                                0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D,
                                0x3D]);
                        let responseArray2 =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            console.log("XX SESSION_ON_OFF_0800 processMediaKeyResponse success");
                            keySession.processMediaKeyResponse(responseArray2).then((keyId) => {
                                expect(sign).assertEqual(1);
                                keySession.destroy();
                                drmsys.destroy();
                                console.log("XX SESSION_ON_OFF_0800 keysChange success");
                                done();
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0800 processMediaKeyResponse err end", err);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0800 processMediaKeyResponse err end", err);
                        });
                    })
                    .catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0800 processMediaKeyResponse err end", err);
                    });
            } else {
                let drmsys = drm.createMediaKeySystem(uuid);
                let keySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                let sign = 1;
                keySession.on('keysChange', (keyInfo, newKeyAvailable) => {
                    console.info('bbbbb receive keysChange newKeyAvailable:' + newKeyAvailable);
                    for (let index = 0; index < keyInfo.length; index++){
                        console.info('bbbbb receive keysChange index:' + index);
                        console.info('bbbbb receive keysChange keyId:' + keyInfo[index].keyId);
                        console.info('bbbbb receive keysChange value:' + keyInfo[index].value);
                    }
                    sign = 2;
                });
                keySession.off('keysChange');
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (DrmRequest) => {
                    let licenseRequestStr = byteToString(DrmRequest.data);
                    let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                    let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    let licenseResponseByte2 = stringToUint8Array(licenseResponseStr);
                    keySession.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                        console.info("XX SESSION_ON_OFF_0800 processMediaKeyResponse success");
                        keySession.processMediaKeyResponse(licenseResponseByte2).then((keyId) => {
                            console.info("XX SESSION_ON_OFF_0800 keysChange sign is ",sign);
                            expect(sign).assertEqual(1);
                            keySession.destroy();
                            drmsys.destroy();
                            console.info("XX SESSION_ON_OFF_0800 keysChange success");
                            done();
                        }).catch((err:BusinessError) =>{
                            console.info("XX SESSION_ON_OFF_0800 processMediaKeyResponse err end", err);
                        });
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0800 processMediaKeyResponse err end", err);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX SESSION_ON_OFF_0800 processMediaKeyResponse err end", err);
                });
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0900
        * @tc.name      : test_on_off_interface_0900
        * @tc.desc      : provisionRequired on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0900', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let sign = 1;
                drmsys.on('keySystemRequired', (eventInfo) => {
                    console.info('bbbbb receive keySystemRequired ' + eventInfo.info);
                    console.info('bbbbb receive keySystemRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                drmsys.generateKeySystemRequest().then((drmRequest) => {
                    console.log("XX SESSION_ON_OFF_0900 generateKeySystemRequest end", drmRequest.data, drmRequest.defaultURL);
                    console.log("XX SESSION_ON_OFF_0900 processKeySystemResponse start");
                    let arry =
                        new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A,
                            0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,
                            0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D,
                            0x3D]);
                    drmsys.processKeySystemResponse(arry).then(() => {
                        expect(sign).assertEqual(2);
                        drmsys.off('keySystemRequired');
                        drmsys.destroy();
                        console.log("XX SESSION_ON_OFF_0900 keySystemRequired success");
                        done();
                    }).catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0900 processKeySystemResponse err end", err);
                    });
                }).catch((err:BusinessError) => {
                    console.log("XX SESSION_ON_OFF_0900 generateKeySystemRequest err end", err);
                });
            } else {
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1000
        * @tc.name      : test_on_off_interface_1000
        * @tc.desc      : provisionRequired on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1000', 1, async (done:Function) => {
            if(sysSupport === true){
                let drmsys = drm.createMediaKeySystem(uuid);
                let sign = 1;
                drmsys.on('keySystemRequired', (eventInfo) => {
                    console.info('bbbbb receive keySystemRequired ' + eventInfo.info);
                    console.info('bbbbb receive keySystemRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                drmsys.off('keySystemRequired');
                drmsys.generateKeySystemRequest().then((drmRequest) => {
                    console.log("XX SESSION_ON_OFF_1000 generateKeySystemRequest end", drmRequest.data, drmRequest.defaultURL);
                    console.log("XX SESSION_ON_OFF_1000 processKeySystemResponse start");
                    let arry =
                        new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A,
                            0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,
                            0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D,
                            0x3D]);
                    drmsys.processKeySystemResponse(arry).then(() => {
                        expect(sign).assertEqual(1);
                        drmsys.destroy();
                        console.log("XX SESSION_ON_OFF_1000 keySystemRequired success");
                        done();
                    }).catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_1000 processKeySystemResponse err end", err);
                    });
                }).catch((err:BusinessError) => {
                    console.log("XX SESSION_ON_OFF_1000 generateKeySystemRequest err end", err);
                });
            } else {
                done();
            }
        });
    })
}
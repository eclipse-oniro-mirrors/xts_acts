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

let systemName:string;
let isClearPlay = drm.isMediaKeySystemSupported("com.clearplay.drm");
if (isClearPlay) {
    systemName = "com.clearplay.drm";
} else {
    systemName = "com.wiseplay.drm";
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX MEDIA_AVPLAYER_0100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                session = drmMediaKeySystem!.createMediaKeySession();
            } catch (err) {
                console.log("XX MEDIA_AVPLAYER_0100 createMediaKeySession failed");
                drmMediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
            let avPlayer = await media.createAVPlayer();
            avPlayer.setDecryptionConfig(session!, false);
            expect(1).assertEqual(1);
            session!.destroy();
            drmMediaKeySystem!.destroy();
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX MEDIA_AVPLAYER_0200 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            let avPlayer = await media.createAVPlayer();
            let MediaKeySystemInfo = avPlayer.getMediaKeySystemInfos();
            if (MediaKeySystemInfo && MediaKeySystemInfo.length > 0) {
                for (let item = 0; item < MediaKeySystemInfo.length; item++) {
                    console.info(`getMediaKeySystemInfos item:${item}, MediaKeySystemInfo[${item}].uuid:${MediaKeySystemInfo[item].uuid}, MediaKeySystemInfo[${item}].pssh:${MediaKeySystemInfo[item].pssh}`);
                }
            }
            expect(MediaKeySystemInfo).assertUndefined();
            drmMediaKeySystem!.destroy();
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_0100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            expect(drmMediaKeySystem!).not().assertUndefined();
            drmMediaKeySystem!.destroy();
            try {
                let metric = drmMediaKeySystem!.getStatistics();
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
        * @tc.desc      : Abnormal systemName
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
        * @tc.desc      : null systemName
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
        * @tc.desc      : one params error systemName
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
        * @tc.desc      : one params null systemName
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
            let isSysSupport = drm.isMediaKeySystemSupported(systemName, "video/mp4");
            expect(isSysSupport).assertTrue();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0700
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params error systemName
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
        * @tc.desc      : two params null systemName
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
            let isSysSupport = drm.isMediaKeySystemSupported(systemName, "1111/2222");
            if (isClearPlay) {
                expect(isSysSupport).assertFalse();
            } else {
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
                let isSysSupport = drm.isMediaKeySystemSupported(systemName, "");
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
            let isSysSupport = drm.isMediaKeySystemSupported(systemName, "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
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
            let isSysSupport = drm.isMediaKeySystemSupported(systemName, "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
            console.log("XX DRM_FRAMEWORK_API_1200 isSysSupport is", isSysSupport);
            expect(isSysSupport).not().assertUndefined();
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
            let isSysSupport = drm.isMediaKeySystemSupported(systemName, "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW);
            console.log("XX DRM_FRAMEWORK_API_1300 isSysSupport is", isSysSupport);
            expect(isSysSupport).not().assertUndefined();
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1400
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,error systemName
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
            let isSysSupport = drm.isMediaKeySystemSupported(systemName, "1111/22222", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            if (isClearPlay) {
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
                let isSysSupport = drm.isMediaKeySystemSupported(systemName, "video/mp4", 7);
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
        * @tc.desc      : three params,null systemName
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
                console.log("XX DRM_FRAMEWORK_API_1700 isMediaKeySystemSupported err end", err.code);
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
            let isSysSupport = drm.isMediaKeySystemSupported(systemName, "", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_1900 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                let drmMediaKeySession = drmMediaKeySystem!.createMediaKeySession(5);
                drmMediaKeySession.destroy();
                done();
                expect(false).assertEqual(true);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_1900 createMediaKeySession err end", err.code);
                errCode = err.code;
                drmMediaKeySystem!.destroy();
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2000 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                session = drmMediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2000 createMediaKeySession failed");
                drmMediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
            expect(session!).not().assertUndefined();
            try {
                let result = session!.requireSecureDecoderModule("video/avc");
                expect(result).assertFalse();
                let result1 = session!.requireSecureDecoderModule("video/hevc");
                expect(result1).assertFalse();
                let result2 = session!.requireSecureDecoderModule("video/avs3");
                expect(result2).assertFalse();
                session!.destroy();
                drmMediaKeySystem!.destroy();
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2000 failed");
                session!.destroy();
                drmMediaKeySystem!.destroy();
            }
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            let drmMaxLevel:drm.ContentProtectionLevel = drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                drmMaxLevel = drmMediaKeySystem!.getMaxContentProtectionLevel();
                console.log("XX DRM_FRAMEWORK_API_2100 getMaxContentProtectionLevel is ", drmMaxLevel);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2100 getMaxContentProtectionLevel failed");
                drmMediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
            if(drmMaxLevel === drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO) {
                try {
                    session = drmMediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
                } catch (err) {
                    console.log("XX DRM_FRAMEWORK_API_2100 createMediaKeySession failed");
                    drmMediaKeySystem!.destroy();
                    done();
                    expect(false).assertEqual(true);
                }
                expect(session!).not().assertUndefined();

                try {
                    let result = session!.requireSecureDecoderModule("video/avc");
                    console.log("XX DRM_FRAMEWORK_API_2100 result is", result);
                    expect(result).not().assertUndefined();
                    let result1 = session!.requireSecureDecoderModule("video/hevc");
                    console.log("XX DRM_FRAMEWORK_API_2100 result1 is", result1);
                    expect(result1).not().assertUndefined();
                    let result2 = session!.requireSecureDecoderModule("video/avs3");
                    console.log("XX DRM_FRAMEWORK_API_2100 result2 is", result2);
                    expect(result2).not().assertUndefined();
                    session!.destroy();
                    drmMediaKeySystem!.destroy();
                } catch (err) {
                    console.log("XX DRM_FRAMEWORK_API_2100 failed");
                    session!.destroy();
                    drmMediaKeySystem!.destroy();
                }
                done();
            } else {
                drmMediaKeySystem!.destroy();
                done();
            }
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            let drmMaxLevel:drm.ContentProtectionLevel = drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2200 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                drmMaxLevel = drmMediaKeySystem!.getMaxContentProtectionLevel();
                console.log("XX DRM_FRAMEWORK_API_2200 getMaxContentProtectionLevel is ", drmMaxLevel);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2200 getMaxContentProtectionLevel failed");
                drmMediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
            if(drmMaxLevel === drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO) {
                try {
                    session = drmMediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
                } catch (err) {
                    console.log("XX DRM_FRAMEWORK_API_2200 createMediaKeySession failed");
                    drmMediaKeySystem!.destroy();
                    done();
                    expect(false).assertEqual(true);
                }
                try {
                    if(isClearPlay) {
                        let result = session!.requireSecureDecoderModule("hls/ts");
                        expect(result).assertFalse();
                        session!.destroy();
                        drmMediaKeySystem!.destroy();
                    } else {
                        try {
                            let result = session!.requireSecureDecoderModule("hls/ts");
                        } catch (err) {
                            console.log("XX DRM_FRAMEWORK_API_2200 requireSecureDecoderModule err end", err.code);
                            expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                        }
                        session!.destroy();
                        drmMediaKeySystem!.destroy();
                    }
                } catch (err) {
                    console.log("XX DRM_FRAMEWORK_API_2200 failed");
                    session!.destroy();
                    drmMediaKeySystem!.destroy();
                }
                done();
            } else {
                drmMediaKeySystem!.destroy();
                done();
            }
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2500 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try{
                let session = drmMediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                session.destroy();
                drmMediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2500 createMediaKeySession err end", err.code);
                errCode = err.code;
                drmMediaKeySystem!.destroy();
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
            let drmMediaKeySystem:drm.MediaKeySystem;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2600 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                let session =
                    drmMediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX);
                session.destroy();
                drmMediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2600 createMediaKeySession err end", err.code);
                errCode = err.code;
                drmMediaKeySystem!.destroy();
            }
            expect(errCode).assertEqual(401);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取设备证书，正常参数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0100', 0, (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let cstatus:drm.CertificateStatus;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                cstatus = drmsys!.getCertificateStatus();
                console.log("XX DRM_AVPLAYER_0100 cstatus is ",cstatus)
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0100 getCertificateStatus failed")
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
            try {
                if(cstatus! != drm.CertificateStatus.CERT_STATUS_PROVISIONED){
                    drmsys!.generateKeySystemRequest().then(async (drmRequest) => {
                        console.info("XX DRM_AVPLAYER_0100 success", drmRequest.data ,drmRequest.defaultURL);
                        let provisionRequestStr = byteToString(drmRequest.data);
                        let provisionResponseStr = await getHttpData(drmRequest.defaultURL, provisionRequestStr);
                        let provisionResponseByte = stringToUint8Array(provisionResponseStr);
                        drmsys!.processKeySystemResponse(provisionResponseByte).then(() => {
                            drmsys!.destroy();
                            console.info("XX DRM_AVPLAYER_0100 processKeySystemResponse success");
                            done();
                        }).catch((err:BusinessError) =>{
                            console.info("XX DRM_AVPLAYER_0100 processKeySystemResponse err end", err.code);
                            drmsys.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) =>{
                        console.info("XX DRM_AVPLAYER_0100 generateKeySystemRequest err end", err.code);
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    drmsys!.destroy();
                    done();
                }
            } catch (err) {
                console.info("XX DRM_AVPLAYER_0100 failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,正常参数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0200', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let cstatus:drm.CertificateStatus;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0200 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0200 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let responseArray:Uint8Array;
            let base64 = new util.Base64();
            let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];

            try {
                session!.generateMediaKeyRequest("video/mp4",uint8pssh,drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (licenseRequestData) => {
                    console.info("XX DRM_AVPLAYER_0200 generateMediaKeyRequest success",licenseRequestData.mediaKeyRequestType,licenseRequestData.data,licenseRequestData.defaultURL);
                    if(isClearPlay){
                        responseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                    } else {
                        let licenseRequestStr = byteToString(licenseRequestData.data);
                        let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense", licenseRequestStr);
                        console.info("XX DRM_AVPLAYER_0200 licenseResponseStr success", licenseResponseStr);
                        responseArray = stringToUint8Array(licenseResponseStr);
                    }
                    session.processMediaKeyResponse(responseArray).then((keyId) => {
                        let keyvalue = session.checkMediaKeyStatus();
                        expect(keyvalue).not().assertUndefined();
                        session.destroy();
                        drmsys.destroy();
                        console.info("XX DRM_AVPLAYER_0200 processMediaKeyResponse success ",keyvalue[0].value);
                        done();
                    }).catch((err:BusinessError) =>{
                        console.info("XX DRM_AVPLAYER_0200 processMediaKeyResponse err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX DRM_AVPLAYER_0200 generateMediaKeyRequest err end", err.code);
                    session.destroy();
                    drmsys.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.info("XX DRM_AVPLAYER_0200 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求minetype异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0300', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0300 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0300 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            try {
                if(isClearPlay){
                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    session!.generateMediaKeyRequest("1111/2222", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_0300 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0300 generateMediaKeyRequest err end", err.code);
                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    });
                } else {
                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    session!.generateMediaKeyRequest("1111/2222", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_0300 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType, DrmRequest.data, DrmRequest.defaultURL);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0300 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0300 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
              * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0400
              * @tc.name      : testGetTrackDescription
              * @tc.desc      : 获取许可证,请求minetype为空
              * @tc.size      : MediumTest
              * @tc.type      : Function test
              * @tc.level     : Level0
              */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0400', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0400 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0400  createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let base64 = new util.Base64();
            let uint8pssh =
                base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];

            try {
                if(isClearPlay){
                    session!.generateMediaKeyRequest(null, uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                        .then((DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_0400 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                                DrmRequest.data, DrmRequest.defaultURL);
                            session.destroy();
                            drmsys.destroy();
                            done();
                            expect(false).assertEqual(true);
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0400 generateMediaKeyRequest err end", err.code);
                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    });
                } else {
                    session!.generateMediaKeyRequest(null, uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                        .then((DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_0400 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                                DrmRequest.data, DrmRequest.defaultURL);
                            session.destroy();
                            drmsys.destroy();
                            done();
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0400 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0400 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0500
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求初始数据异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0500', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0500 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0500 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let base64 = new util.Base64();
            let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q=');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];

            try {
                session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_0500 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        session.destroy();
                        drmsys.destroy();
                        done();
                    }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_0500 generateMediaKeyRequest err end", err.code);
                    session.destroy();
                    drmsys.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0500 failed");
                session!.destroy();
                drmsys!.destroy();
                expect(false).assertEqual(true);
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求初始数据为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0600', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0600 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0600 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];

            try {
                session!.generateMediaKeyRequest("video/mp4", null, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then((DrmRequest) => {
                    console.log("XX DRM_AVPLAYER_0600 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    session.destroy();
                    drmsys.destroy();
                    done();
                    expect(false).assertEqual(true);
                }).catch((err:BusinessError) =>{
                    console.log("XX DRM_AVPLAYER_0600 generateMediaKeyRequest err end", err.code);
                    expect(err.code).assertEqual(401);
                    session.destroy();
                    drmsys.destroy();
                    done();
                });
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0600 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求的licensetype异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0700', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0700 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0700 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let base64 = new util.Base64();
            let uint8pssh =
                base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];

            try {
                session!.generateMediaKeyRequest("video/mp4", uint8pssh, 3, optionalData).then((DrmRequest) => {
                    console.log("XX DRM_AVPLAYER_0700 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                        DrmRequest.data, DrmRequest.defaultURL);
                    session.destroy();
                    drmsys.destroy();
                    done();
                    expect(false).assertEqual(true);
                }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_0700 generateMediaKeyRequest err end", err.code);
                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                    session.destroy();
                    drmsys.destroy();
                    done();
                });
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0700 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,响应报文异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0800', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0800 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0800 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let base64 = new util.Base64();
            let uint8pssh =
                base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];

            try {
                session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_0800 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray = new Uint8Array([1, 2, 3, 4, 5]);
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            console.log("XX DRM_AVPLAYER_0800 processMediaKeyresponse success", keyId);
                            session.destroy();
                            drmsys.destroy();
                            done();
                            expect(false).assertEqual(true);
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_0800 processMediaKeyResponse err end", err.code);
                            expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                            session.destroy();
                            drmsys.destroy();
                            done();
                        });
                    }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_0800 generateMediaKeyRequest err end", err.code);
                    session.destroy();
                    drmsys.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0800 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0900
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,正常删除许可证信息，正常检查许可证状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0900', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0900 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0900 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let base64 = new util.Base64();
            let uint8pssh =
                base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];

            try {
                if(isClearPlay){
                    let errCode = 0;
                    session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                        .then((DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_0900 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                                DrmRequest.data, DrmRequest.defaultURL);
                            let responseArray =
                                new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                    0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                    0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                    0x3D]);
                            session.processMediaKeyResponse(responseArray).then((keyId) => {
                                let keyvalue = session.checkMediaKeyStatus();
                                console.log("XX DRM_AVPLAYER_0900 keyvalue", keyvalue[0].value);
                                expect(keyvalue[0].value).assertEqual('MediaKey is OK');
                                session.clearMediaKeys();
                                console.log("XX DRM_AVPLAYER_0900 clearMediaKeys");
                                try {
                                    let keyvalue2 = session.checkMediaKeyStatus();
                                } catch (err) {
                                    console.log("XX DRM_AVPLAYER_0900 generateKeySystemRequest err end", err);
                                    errCode = err.code;
                                }
                                expect(errCode).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                                session.destroy();
                                drmsys.destroy();
                                console.log("XX DRM_AVPLAYER_0900 processMediaKeyResponse success", keyId);
                                done();
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_0900 processMediaKeyResponse err end", err.code);
                                session.destroy();
                                drmsys.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_0900 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                        .then(async (DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_0900 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
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
                                    expect(keyvalue2[i].value).not().assertUndefined();
                                }
                                session.destroy();
                                drmsys.destroy();
                                console.log("XX DRM_AVPLAYER_0900 processMediaKeyResponse success", keyId);
                                done();
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_0900 processMediaKeyResponse err end", err.code);
                                session.destroy();
                                drmsys.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        })
                        .catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_0900 generateMediaKeyRequest err end", err.code);
                            session.destroy();
                            drmsys.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_0900 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1000
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，获取离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1000', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1000 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1000 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let responseArray:Uint8Array;
            let base64 = new util.Base64();
            let uint8pssh =
                base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];

            try {
                session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then(async (DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1000 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        if(isClearPlay) {
                            responseArray =
                                new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                    0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                    0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                    0x3D]);
                        } else {
                            let licenseRequestStr = byteToString(DrmRequest.data);
                            let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense", licenseRequestStr);
                            responseArray = stringToUint8Array(licenseResponseStr);
                        }
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            console.log("keyIds is", keyIds);
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            session.destroy();
                            drmsys.destroy();
                            console.log("XX DRM_AVPLAYER_1000 processMediaKeyResponse success", keyId);
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1000 generateMediaKeyRequest err end", err.code);
                            session.destroy();
                            drmsys.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_1000 processMediaKeyResponse err end", err.code);
                    session.destroy();
                    drmsys.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1000 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1100', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1100 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            let base64 = new util.Base64();
            let responseArray:Uint8Array;
            let uint8pssh =
                base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            let optionalData:drm.OptionsData[] = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];
            try {
                session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                    .then(async (DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        if(isClearPlay){
                            responseArray =
                                new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                    0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                    0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                    0x3D]);
                        } else {
                            let licenseRequestStr = byteToString(DrmRequest.data);
                            let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense", licenseRequestStr);
                            responseArray = stringToUint8Array(licenseResponseStr);
                        }
                        session.processMediaKeyResponse(responseArray).then((keyId) => {
                            console.log("XX DRM_AVPLAYER_1100 processMediaKeyResponse success ",responseArray);
                            let keyIds = drmsys.getOfflineMediaKeyIds();
                            let arry = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            drmsys.clearOfflineMediaKeys(arry);
                            OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                            session.destroy();
                            drmsys.destroy();
                            done();
                            expect(false).assertEqual(true);
                        }).catch((err:BusinessError) => {
                            console.log("XX DRM_AVPLAYER_1100 processMediaKeyResponse error", err.code);
                            session.destroy();
                            drmsys.destroy();
                            done();
                        });
                    }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_1100 generateMediaKeyRequest err end", err.code);
                    session.destroy();
                    drmsys.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1100 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，无效离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1200', 0, (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1200 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            let arry = new Uint8Array([1, 2, 3, 4, 5]);
            try {
                let OfflineKeyState = drmsys!.getOfflineMediaKeyStatus(arry);
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }catch (err) {
                console.log("XX DRM_AVPLAYER_1200 getOfflineMediaKeyStatus err end", err.code);
                expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                drmsys!.destroy();
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线许可证，错误参数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1300', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1300 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                drmsys!.clearOfflineMediaKeys(new Uint8Array([1, 2, 3, 4, 5]));
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            } catch(err) {
                console.log("XX DRM_AVPLAYER_1300 clearOfflineMediaKeys err end", err.code);
                expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                drmsys!.destroy();
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1400
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线许可证，参数为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1400', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1400 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                drmsys!.clearOfflineMediaKeys(null);
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            } catch(err) {
                console.log("XX DRM_AVPLAYER_1400 clearOfflineMediaKeys err end", err.code);
                expect(err.code).assertEqual(401);
                drmsys!.destroy();
                done();
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1500
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，正常传参
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1500', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                if(isClearPlay){
                    try {
                        drmsys = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1500 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }

                    try {
                        session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1500 createMediaKeySession failed");
                        drmsys!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }

                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                        .then((DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_1500 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
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
                                    console.log("XX DRM_AVPLAYER_1500 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                    session.processOfflineReleaseResponse(keyArray, responseArray).then(() => {
                                        OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                                        expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                                        session.destroy();
                                        drmsys.destroy();
                                        console.log("XX DRM_AVPLAYER_1500 processOfflineReleaseResponse success");
                                        console.log("XX DRM_AVPLAYER_1500 processMediaKeyResponse success");
                                        done();
                                    }).catch((err:BusinessError) => {
                                        console.log("XX DRM_AVPLAYER_1500 processOfflineReleaseResponse err end", err.code);
                                        session.destroy();
                                        drmsys.destroy();
                                        done();
                                        expect(false).assertEqual(true);
                                    });
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_1500 generateOfflineReleaseRequest err end", err.code);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_1500 processMediaKeyResponse err end", err.code);
                                session.destroy();
                                drmsys.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1500 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1500 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，请求参数异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1600', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                if (isClearPlay) {
                    try {
                        drmsys = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1600 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }

                    try {
                        session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1600 createMediaKeySession failed");
                        drmsys!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }
                    let base64 = new util.Base64();
                    let uint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                        .then((DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_1600 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType, DrmRequest.data, DrmRequest.defaultURL);
                            let responseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                            session.processMediaKeyResponse(responseArray).then((keyId) => {
                                let keyIds = drmsys.getOfflineMediaKeyIds();
                                let arry = new Uint8Array(keyIds[0]);
                                let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                                expect(OfflineKeyState)
                                    .assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                                let keyArray = new Uint8Array([1, 2, 3, 4, 5]);
                                session.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                    console.log("XX DRM_AVPLAYER_1600 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                    session.processOfflineReleaseResponse(keyArray, responseArray).then(() => {
                                        OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                                    }).catch((err:BusinessError) => {
                                        console.log("XX DRM_AVPLAYER_1600 processOfflineReleaseResponse err end", err.code);
                                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                                        session.destroy();
                                        drmsys.destroy();
                                        done();
                                    });
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_1600 generateOfflineReleaseRequest err end", err.code);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_1600 processMediaKeyResponse err end", err.code);
                                session.destroy();
                                drmsys.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1600 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                }
                else {
                    done();
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1600 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，请求参数为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1700', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                if(isClearPlay){
                    try {
                        drmsys = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1700 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }

                    try {
                        session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1700 createMediaKeySession failed");
                        drmsys!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }

                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                        .then((DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_1700 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
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
                                    console.log("XX DRM_AVPLAYER_1700 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_1700 generateOfflineReleaseRequest err end", err.code);
                                    expect(err.code).assertEqual(401);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_1700 processMediaKeyResponse err end", err.code);
                                session.destroy();
                                drmsys.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1700 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1700 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常licenseid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1800', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                if (isClearPlay){
                    try {
                        drmsys = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1800 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }

                    try {
                        session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1800 createMediaKeySession failed");
                        drmsys!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }

                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
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
                                let keyArray = new Uint8Array(keyIds[0]);
                                session.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                    console.log("XX DRM_AVPLAYER_1800 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                    session.processOfflineReleaseResponse(new Uint8Array([1, 2, 3, 4, 5]), responseArray).then(() => {
                                        console.log("XX DRM_AVPLAYER_1800 processOfflineReleaseResponse success");
                                    }).catch((err:BusinessError) => {
                                        console.log("XX DRM_AVPLAYER_1800 processOfflineReleaseResponse err end", err.code);
                                        expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                                        session.destroy();
                                        drmsys.destroy();
                                        done();
                                    });
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_1800 generateOfflineReleaseRequest err end", err.code);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_1800 processMediaKeyResponse err end", err.code);
                                session.destroy();
                                drmsys.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1800 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1800 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1900
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常响应报文
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1900', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                if (isClearPlay){
                    try {
                        drmsys = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1900 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }

                    try {
                        session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_1900 createMediaKeySession failed");
                        drmsys!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }

                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                        .then((DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_1900 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                                DrmRequest.data, DrmRequest.defaultURL);
                            let responseArray =
                                new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                    0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                    0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                    0x3D]);
                            session.processMediaKeyResponse(responseArray).then((keyId) => {
                                console.log("XX DRM_AVPLAYER_1900 processMediaKeyResponse success");
                                let keyIds = drmsys.getOfflineMediaKeyIds();
                                let keyArray = new Uint8Array(keyIds[0]);
                                let OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                                session.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                    console.log("XX DRM_AVPLAYER_1900 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                    session.processOfflineReleaseResponse(keyArray, new Uint8Array([1, 2, 3, 4, 5])).then(() => {
                                        OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                                        expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                                        session.destroy();
                                        drmsys.destroy();
                                        console.log("XX DRM_AVPLAYER_1900 processOfflineReleaseResponse success");
                                        console.log("XX DRM_AVPLAYER_1900 processMediaKeyResponse success");
                                        done();
                                    }).catch((err:BusinessError) => {
                                        console.log("XX DRM_AVPLAYER_1900 processOfflineReleaseResponse err end", err.code);
                                        session.destroy();
                                        drmsys.destroy();
                                        done();
                                        expect(false).assertEqual(true);
                                    });
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_1900 generateOfflineReleaseRequest err end", err.code);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_1900 processMediaKeyResponse err end", err.code);
                                session.destroy();
                                drmsys.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_1900 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_1900 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2000
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常响应报文为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2000', 0, async (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                if(isClearPlay) {
                    try {
                        drmsys = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_2000 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }

                    try {
                        session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                    } catch (err) {
                        console.log("XX DRM_AVPLAYER_2000 createMediaKeySession failed");
                        drmsys!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }
                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    session!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData)
                        .then((DrmRequest) => {
                            console.log("XX DRM_AVPLAYER_2000 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
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
                                    console.log("XX DRM_AVPLAYER_2000 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                    session.processOfflineReleaseResponse(keyArray, null).then(() => {
                                        console.log("XX DRM_AVPLAYER_2000 processOfflineReleaseResponse success");
                                    }).catch((err:BusinessError) => {
                                        console.log("XX DRM_AVPLAYER_2000 processOfflineReleaseResponse err end", err.code);
                                        expect(err.code).assertEqual(401);
                                        session.destroy();
                                        drmsys.destroy();
                                        done();
                                    });
                                }).catch((err:BusinessError) => {
                                    console.log("XX DRM_AVPLAYER_2000 generateOfflineReleaseRequest err end", err.code);
                                    session.destroy();
                                    drmsys.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX DRM_AVPLAYER_2000 processMediaKeyResponse err end", err.code);
                                session.destroy();
                                drmsys.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX DRM_AVPLAYER_2000 generateMediaKeyRequest err end", err.code);
                        session.destroy();
                        drmsys.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2000 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证restore,传错误的licenseid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2100', 0, (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2100 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
            try {
                session!.restoreOfflineMediaKeys(new Uint8Array([1, 2, 3, 4, 5])).then(() => {
                    console.log("XX DRM_AVPLAYER_2100 restoreOfflineMediaKeys success");
                }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_2100 restoreOfflineMediaKeys err end", err.code);
                    expect(err.code).assertEqual(drm.DrmErrorCode.SERVICE_FATAL_ERROR);
                    session.destroy();
                    drmsys.destroy();
                    done();
                });
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2100 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证restore,licenseid为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2200', 0, (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            let session:drm.MediaKeySession;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2200 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                session = drmsys!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2200 createMediaKeySession failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            try {
                session!.restoreOfflineMediaKeys(null).then(() => {
                    console.log("XX DRM_AVPLAYER_2200 restoreOfflineMediaKeys success");
                }).catch((err:BusinessError) => {
                    console.log("XX DRM_AVPLAYER_2200 restoreOfflineMediaKeys err end", err.code);
                    expect(err.code).assertEqual(401);
                    session.destroy();
                    drmsys.destroy();
                    done();
                });
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2200 failed");
                session!.destroy();
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 设备证书状态查询
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2300', 0, (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2300 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                let cstatus = drmsys!.getCertificateStatus();
                console.log("XX DRM_AVPLAYER_2300 cstatus is ",cstatus);
                expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
                drmsys!.destroy();
                done();
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2300 failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取插件name以及systemName
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2600', 0, (done:Function) => {
            let MediaKeySystemDescription = drm.getMediaKeySystems();
            for (let i = 0; i < MediaKeySystemDescription.length; i++) {
                console.log("XX DRM_AVPLAYER_2600 name is ", MediaKeySystemDescription[i].name);
                console.log("XX DRM_AVPLAYER_2600 uuid is ", MediaKeySystemDescription[i].uuid);
                expect(MediaKeySystemDescription[i].name).not().assertUndefined();
                expect(MediaKeySystemDescription[i].uuid).not().assertUndefined();
            }
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取插件最大安全等级
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2700', 0, (done:Function) => {
            let drmsys:drm.MediaKeySystem;
            try {
                drmsys = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2700 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                let drmMaxLevel = drmsys!.getMaxContentProtectionLevel();
                console.log("XX DRM_AVPLAYER_2700 level is ", drmMaxLevel);
                expect(drmMaxLevel).not().assertUndefined();
                drmsys!.destroy();
                done();
            } catch (err) {
                console.log("XX DRM_AVPLAYER_2700 failed");
                drmsys!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取插件name以及uuid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2800', 0, (done:Function) => {
            let drmUuid = drm.getMediaKeySystemUuid(systemName);
            console.log("XX DRM_AVPLAYER_2800 uuid is ", drmUuid);
            expect(drmUuid).not().assertUndefined();
            done();
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
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                if (isClearPlay) {
                    mediaKeySystem!.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, "ABC");
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                    expect(getCfg).assertEqual("ABC");
                } else {
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                    expect(getCfg).not().assertUndefined();
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0100 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0200
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值，输入错误的propertyName
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0200', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0200 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            try {
                if (isClearPlay) {
                    mediaKeySystem!.setConfigurationString("version_id", "1.1");
                    let getCfg = mediaKeySystem!.getConfigurationString("version_id");
                    expect(getCfg).assertEqual("1.1");
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0200 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0300
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋两次值，看最终结果是否覆盖
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0300', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0300 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    mediaKeySystem!.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, 'ABC');
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                    expect(getCfg).assertEqual('ABC');
                    mediaKeySystem!.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, 'EFGH');
                    getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                    expect(getCfg).assertEqual('EFGH');
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0300 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0400 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    mediaKeySystem!.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION, "1.1");
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                    expect(getCfg).assertEqual("1.1");
                } else {
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                    expect(getCfg).not().assertUndefined();
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0400 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0500
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0500', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0500 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    mediaKeySystem!.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION, "Test Set Get Config");
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                    expect(getCfg).assertEqual("Test Set Get Config");
                } else {
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                    expect(getCfg).assertEqual("WisePlay DRM");
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0500 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0600
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0600', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0600 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    mediaKeySystem!.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS, "AES");
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                    expect(getCfg).assertEqual("AES");
                } else {
                    let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                    expect(getCfg).assertEqual("AES/CBC/NoPadding,AES/CTR/NoPadding,SM4/CBC/NoPadding");
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0600 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0700
        * @tc.name      : testSet_get_config
        * @tc.desc      : get systemid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0700', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0700 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (!isClearPlay) {
                    let getCfg = mediaKeySystem!.getConfigurationString("systemId");
                    console.info("XX SET_GET_CONFIG_0700 getCfg is",getCfg)
                    expect(getCfg).assertEqual("3d5e6d35-9b9a-41e8-b843-dd3c6e72c42c");
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0700 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0800
        * @tc.name      : testSet_get_config
        * @tc.desc      : get deviceUniqueId
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0800', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0800 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (!isClearPlay) {
                    let getCfg = mediaKeySystem!.getConfigurationByteArray('deviceUniqueId');
                    console.info("XX SET_GET_CONFIG_0800 getCfg is",getCfg);
                    let getCfgString = byteToString(getCfg);
                    console.info("XX SET_GET_CONFIG_0800 getCfgString is",getCfgString);
                    expect(getCfg).not().assertUndefined();
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0800 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0900
        * @tc.name      : testSet_get_config
        * @tc.desc      : 查询最大会话数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0900', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0900 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    mediaKeySystem!.setConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, "64");
                }
                let getCfg = mediaKeySystem!.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertEqual("64");
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_0900 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1100
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值然后获取属性值(Uint8array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1100', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("ABC");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1100 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1200
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值，输入错误的propertyName(Uint8Array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1200', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1200 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("ABC");
                    mediaKeySystem!.setConfigurationByteArray("version_id", valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray("version_id");
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1200 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1300
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋两次值，看最终结果是否覆盖(Uint8Array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1300', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1300 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("ABC");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                    valueArray = stringToUint8Array("EFG");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                    getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1300 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1400
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1400', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1400 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("1.1");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1400 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1500
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1500', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1500 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("Test Set Get Config");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1500 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1600
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1600', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1600 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("AES");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1600 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1700
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1700', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1700 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("7E8G9D");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1700 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1800
        * @tc.name      : testSet_get_config
        * @tc.desc      : 设置最大会话数为0
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1800', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1800 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("0");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1800 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1900
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给maxSessionNum赋值，超过默认最大数64
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1900', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1900 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("65");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1900 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2000
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给maxSessionNum赋值1，创建两个会话
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2000', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_2000 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                if (isClearPlay) {
                    let valueArray = stringToUint8Array("1");
                    mediaKeySystem!.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                    let getCfg = mediaKeySystem!.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                    for (let i = 0; i < getCfg.length; i++) {
                        expect(getCfg[i]).assertEqual(valueArray[i]);
                    }
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_2000 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
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
            let mediaKeySystem:drm.MediaKeySystem;
            let keySession:drm.MediaKeySession;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0100 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                keySession = mediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0100 createMediaKeySession failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            try {
                let licenseResponseByte:Uint8Array;
                let sign = 1;
                keySession!.on('keyRequired', (eventInfo) => {
                    console.info('bbbbb receive keyRequired ' + eventInfo.info);
                    console.info('bbbbb receive keyRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (DrmRequest) => {
                    console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    if(isClearPlay){
                        licenseResponseByte =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                    } else {
                        let licenseRequestStr = byteToString(DrmRequest.data);
                        let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                        licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    }
                    keySession.processMediaKeyResponse(licenseResponseByte).then(async (keyId) => {
                        console.info("XX SESSION_ON_OFF_0100 is ",sign)
                        await sleep(30000);
                        expect(sign).assertEqual(2);
                        console.info("XX SESSION_ON_OFF_0100 2 is ",sign)
                        keySession.off('keyRequired');
                        keySession.destroy();
                        mediaKeySystem.destroy();
                        done();
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0100 processMediaKeyResponse err end", err.code);
                        keySession.destroy();
                        mediaKeySystem.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX SESSION_ON_OFF_0100 generateMediaKeyRequest err end", err.code);
                    keySession.destroy();
                    mediaKeySystem.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0100 failed");
                keySession!.destroy();
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            let keySession:drm.MediaKeySession;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0200 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                keySession = mediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0200 createMediaKeySession failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            try {
                let licenseResponseByte:Uint8Array;
                let sign = 1;
                keySession!.on('keyRequired', (eventInfo) => {
                    console.info('bbbbb receive keyRequired ' + eventInfo.info);
                    console.info('bbbbb receive keyRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                keySession!.off('keyRequired');
                let base64 = new util.Base64();
                let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData).then(async (DrmRequest) => {
                    console.info("XX SESSION_ON_OFF_0200 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                    if(isClearPlay){
                        licenseResponseByte =
                            new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                    } else {
                        let licenseRequestStr = byteToString(DrmRequest.data);
                        let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                        licenseResponseByte = stringToUint8Array(licenseResponseStr);
                    }
                    keySession.processMediaKeyResponse(licenseResponseByte).then(async (keyId) => {
                        console.info("XX SESSION_ON_OFF_0200 is ",sign)
                        await sleep(30000);
                        expect(sign).assertEqual(1);
                        console.info("XX SESSION_ON_OFF_0200 2 is ",sign)
                        keySession.destroy();
                        mediaKeySystem.destroy();
                        done();
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0200 processMediaKeyResponse err end", err.code);
                        keySession.destroy();
                        mediaKeySystem.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                }).catch((err:BusinessError) =>{
                    console.info("XX SESSION_ON_OFF_0200 generateMediaKeyRequest err end", err.code);
                    keySession.destroy();
                    mediaKeySystem.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0200 failed");
                keySession!.destroy();
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            let keySession:drm.MediaKeySession;
            try {
                if(isClearPlay){
                    try {
                        mediaKeySystem = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX SESSION_ON_OFF_0300 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }

                    try {
                        keySession = mediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                    } catch (err) {
                        console.log("XX SESSION_ON_OFF_0300 createMediaKeySession failed");
                        mediaKeySystem!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }
                    let sign = 1;
                    keySession!.on('keyExpired', (eventInfo) => {
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
                    keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
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
                                    mediaKeySystem.destroy();
                                    console.log("XX SESSION_ON_OFF_0300 keyExpired success");
                                    done();
                                }).catch((err:BusinessError) => {
                                    console.log("XX SESSION_ON_OFF_0300 processMediaKeyResponse err end", err.code);
                                    keySession.destroy();
                                    mediaKeySystem.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0300 processMediaKeyResponse err end", err.code);
                                keySession.destroy();
                                mediaKeySystem.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0300 generateMediaKeyRequest err end", err.code);
                        keySession.destroy();
                        mediaKeySystem.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0300 failed");
                keySession!.destroy();
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            let keySession:drm.MediaKeySession;
            try {
                if(isClearPlay){
                    try {
                        mediaKeySystem = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX SESSION_ON_OFF_0400 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }

                    try {
                        keySession = mediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                    } catch (err) {
                        console.log("XX SESSION_ON_OFF_0400 createMediaKeySession failed");
                        mediaKeySystem!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    }

                    let sign = 1;
                    keySession!.on('keyExpired', (eventInfo) => {
                        console.info('bbbbb receive keyExpired ' + eventInfo.info);
                        console.info('bbbbb receive keyExpired ' + eventInfo.extraInfo);
                        sign = 2;
                    });
                    keySession!.off('keyExpired');
                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
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
                                    mediaKeySystem.destroy();
                                    console.log("XX SESSION_ON_OFF_0400 keyExpired success");
                                    done();
                                }).catch((err:BusinessError) => {
                                    console.log("XX SESSION_ON_OFF_0400 processMediaKeyResponse err end", err.code);
                                    keySession!.destroy();
                                    mediaKeySystem!.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0400 processMediaKeyResponse err end", err.code);
                                keySession!.destroy();
                                mediaKeySystem!.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0400 generateMediaKeyRequest err end", err.code);
                        keySession!.destroy();
                        mediaKeySystem!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0400 failed");
                keySession!.destroy();
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            let keySession:drm.MediaKeySession;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0500 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                keySession = mediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0500 createMediaKeySession failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            try {
                if(isClearPlay){
                    let sign = 1;
                    keySession!.on('expirationUpdate', (eventInfo) => {
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
                    keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData).then((DrmRequest) => {
                        console.log("XX SESSION_ON_OFF_0500 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = mediaKeySystem.getOfflineMediaKeyIds();
                            let keyArray = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = mediaKeySystem.getOfflineMediaKeyStatus(keyArray);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            keySession.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                console.log("XX SESSION_ON_OFF_0500 generateOfflineReleaseRequest end", OfflineReleaseRequest);
                                keySession.processOfflineReleaseResponse(keyArray, responseArray).then(() => {
                                    OfflineKeyState = mediaKeySystem.getOfflineMediaKeyStatus(keyArray);
                                    expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                                    keySession.restoreOfflineMediaKeys(keyArray).then(() => {
                                        expect(sign).assertEqual(2);
                                        keySession.off('expirationUpdate');
                                        keySession.destroy();
                                        mediaKeySystem.destroy();
                                        console.log("XX SESSION_ON_OFF_0500 expirationUpdate success");
                                        done();
                                    }).catch((err:BusinessError) =>{
                                        console.log("XX SESSION_ON_OFF_0500 restoreOfflineMediaKeys err end", err.code);
                                        keySession!.destroy();
                                        mediaKeySystem!.destroy();
                                        done();
                                        expect(false).assertEqual(true);
                                    });
                                }).catch((err:BusinessError) =>{
                                    console.log("XX SESSION_ON_OFF_0500 processOfflineReleaseResponse err end", err.code);
                                    keySession!.destroy();
                                    mediaKeySystem!.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) =>{
                                console.log("XX SESSION_ON_OFF_0500 generateOfflineReleaseRequest err end", err.code);
                                keySession!.destroy();
                                mediaKeySystem!.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) =>{
                            console.log("XX SESSION_ON_OFF_0500 processMediaKeyResponse err end", err.code);
                            keySession!.destroy();
                            mediaKeySystem!.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) =>{
                        console.log("XX SESSION_ON_OFF_0500 generateMediaKeyRequest err end", err.code);
                        keySession!.destroy();
                        mediaKeySystem!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    let sign = 1;
                    keySession!.on('expirationUpdate', (eventInfo) => {
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
                    keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData).then(async (DrmRequest) => {
                        console.info("XX SESSION_ON_OFF_0500 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                        let licenseRequestStr = byteToString(DrmRequest.data);
                        let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                        let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                        keySession.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                            console.info("XX SESSION_ON_OFF_0500 expirationUpdate sign is ",sign);
                            expect(sign).assertEqual(2);
                            keySession.off('expirationUpdate');
                            keySession.destroy();
                            mediaKeySystem.destroy();
                            console.info("XX SESSION_ON_OFF_0500 expirationUpdate success");
                            done();
                        }).catch((err:BusinessError) =>{
                            console.info("XX SESSION_ON_OFF_0500 processMediaKeyResponse err end", err.code);
                            keySession!.destroy();
                            mediaKeySystem!.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0500 generateMediaKeyRequest err end", err.code);
                        keySession!.destroy();
                        mediaKeySystem!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                }
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0500 failed");
                keySession!.destroy();
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            let keySession:drm.MediaKeySession;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0600 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                keySession = mediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0600 createMediaKeySession failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            try {
                if(isClearPlay){
                    let sign = 1;
                    keySession!.on('expirationUpdate', (eventInfo) => {
                        console.info('bbbbb receive expirationUpdate ' + eventInfo.info);
                        console.info('bbbbb receive expirationUpdate ' + eventInfo.extraInfo);
                        sign = 2;
                    });
                    keySession!.off('expirationUpdate');
                    let base64 = new util.Base64();
                    let uint8pssh =
                        base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE,
                        optionalData).then((DrmRequest) => {
                        console.log("XX DRM_AVPLAYER_1900 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,
                            DrmRequest.data, DrmRequest.defaultURL);
                        let responseArray =
                            new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                0x3D]);
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            let keyIds = mediaKeySystem.getOfflineMediaKeyIds();
                            let keyArray = new Uint8Array(keyIds[0]);
                            let OfflineKeyState = mediaKeySystem.getOfflineMediaKeyStatus(keyArray);
                            expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                            keySession.generateOfflineReleaseRequest(keyArray).then((OfflineReleaseRequest) => {
                                console.log("XX SESSION_ON_OFF_0600 generateOfflineReleaseRequest success", OfflineReleaseRequest);
                                keySession.processOfflineReleaseResponse(keyArray, responseArray).then(() => {
                                    OfflineKeyState = mediaKeySystem.getOfflineMediaKeyStatus(keyArray);
                                    expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                                    keySession.restoreOfflineMediaKeys(keyArray).then(() => {
                                        expect(sign).assertEqual(1);
                                        keySession.destroy();
                                        mediaKeySystem.destroy();
                                        console.log("XX SESSION_ON_OFF_0600 expirationUpdate success");
                                        done();
                                    }).catch((err:BusinessError) => {
                                        console.log("XX SESSION_ON_OFF_0600 restoreOfflineMediaKeys err end", err.code);
                                        keySession.destroy();
                                        mediaKeySystem.destroy();
                                        done();
                                        expect(false).assertEqual(true);
                                    });
                                }).catch((err:BusinessError) => {
                                    console.log("XX SESSION_ON_OFF_0600 processOfflineReleaseResponse err end", err.code);
                                    keySession.destroy();
                                    mediaKeySystem.destroy();
                                    done();
                                    expect(false).assertEqual(true);
                                });
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0600 generateOfflineReleaseRequest err end", err.code);
                                keySession.destroy();
                                mediaKeySystem.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0600 processMediaKeyResponse err end", err.code);
                            keySession.destroy();
                            mediaKeySystem.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0600 generateMediaKeyRequest err end", err.code);
                        keySession.destroy();
                        mediaKeySystem.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    let sign = 1;
                    keySession!.on('expirationUpdate', (eventInfo) => {
                        console.info('bbbbb receive expirationUpdate ' + eventInfo.info);
                        console.info('bbbbb receive expirationUpdate ' + eventInfo.extraInfo);
                        sign = 2;
                    });
                    keySession!.off('expirationUpdate');
                    let base64 = new util.Base64();
                    let uint8pssh = base64.decodeSync('AAAA73Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAM97InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoieHV4aW5zdyIsImtpZHMiOlsiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDAiLCJhY2EyNTVlNWIyZGRlMmU0YzhiYjdjMTY2Y2VhYzEwMSIsImFjYTI1NWU1YjJkZGUyZTRjOGJiN2MxNjZjZWFjMTAxIiwiYWNhMjU1ZTViMmRkZTJlNGM4YmI3YzE2NmNlYWMxMDEiXSwiZW5zY2hlbWEiOiJjYmMxIn0=');
                    let optionalData:drm.OptionsData[] = [{
                        name: "optionalDataName",
                        value: "optionalDataValue"
                    }];
                    keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData).then(async (DrmRequest) => {
                        console.info("XX SESSION_ON_OFF_0600 generateMediaKeyRequest success", DrmRequest.mediaKeyRequestType,DrmRequest.data, DrmRequest.defaultURL);
                        let licenseRequestStr = byteToString(DrmRequest.data);
                        let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                        let licenseResponseByte = stringToUint8Array(licenseResponseStr);
                        keySession.processMediaKeyResponse(licenseResponseByte).then((keyId) => {
                            console.info("XX SESSION_ON_OFF_0600 expirationUpdate sign is ",sign);
                            expect(sign).assertEqual(1);
                            keySession.destroy();
                            mediaKeySystem.destroy();
                            console.info("XX SESSION_ON_OFF_0600 expirationUpdate success");
                            done();
                        }).catch((err:BusinessError) =>{
                            console.info("XX SESSION_ON_OFF_0600 processMediaKeyResponse err end", err.code);
                            keySession.destroy();
                            mediaKeySystem.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) =>{
                        console.info("XX SESSION_ON_OFF_0600 generateMediaKeyRequest err end", err.code);
                        keySession.destroy();
                        mediaKeySystem.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                }
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0600 failed");
                keySession!.destroy();
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            let keySession:drm.MediaKeySession;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0700 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                keySession = mediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0700 createMediaKeySession failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            try {
                let sign = 1;
                keySession!.on('keysChange', (keyInfo, newKeyAvailable) => {
                    console.info('bbbbb receive keysChange newKeyAvailable:' + newKeyAvailable);
                    for (let index = 0; index < keyInfo.length; index++) {
                        console.info('bbbbb receive keysChange index:' + index);
                        console.info('bbbbb receive keysChange keyId:' + keyInfo[index].keyId);
                        console.info('bbbbb receive keysChange value:' + keyInfo[index].value);
                    }
                    sign = 2;
                });
                let responseArray:Uint8Array;
                let responseArray2:Uint8Array;
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then(async (DrmRequest) => {
                        if(isClearPlay) {
                            responseArray =
                                new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A,
                                    0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,
                                    0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D,
                                    0x3D]);
                            responseArray2 =
                                new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                    0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                    0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                    0x3D]);
                        } else {
                            let licenseRequestStr = byteToString(DrmRequest.data);
                            let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                            responseArray = stringToUint8Array(licenseResponseStr);
                            responseArray2 = stringToUint8Array(licenseResponseStr);
                        }
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse success");
                            keySession.processMediaKeyResponse(responseArray2).then((keyId) => {
                                expect(sign).assertEqual(2);
                                keySession.off('keysChange');
                                keySession.destroy();
                                mediaKeySystem.destroy();
                                console.log("XX SESSION_ON_OFF_0700 keysChange success");
                                done();
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                                keySession.destroy();
                                mediaKeySystem.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                            keySession.destroy();
                            mediaKeySystem.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) => {
                    console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                    keySession.destroy();
                    mediaKeySystem.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0700 failed");
                keySession!.destroy();
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            let keySession:drm.MediaKeySession;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0800 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                keySession = mediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0800 createMediaKeySession failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }

            try {
                let sign = 1;
                keySession!.on('keysChange', (keyInfo, newKeyAvailable) => {
                    console.info('bbbbb receive keysChange newKeyAvailable:' + newKeyAvailable);
                    for (let index = 0; index < keyInfo.length; index++) {
                        console.info('bbbbb receive keysChange index:' + index);
                        console.info('bbbbb receive keysChange keyId:' + keyInfo[index].keyId);
                        console.info('bbbbb receive keysChange value:' + keyInfo[index].value);
                    }
                    sign = 2;
                });
                keySession!.off('keysChange');
                let responseArray:Uint8Array;
                let responseArray2:Uint8Array;
                let base64 = new util.Base64();
                let uint8pssh =
                    base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                let optionalData:drm.OptionsData[] = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                keySession!.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData)
                    .then(async (DrmRequest) => {
                        if(isClearPlay) {
                            responseArray =
                                new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A,
                                    0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,
                                    0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D,
                                    0x3D]);
                            responseArray2 =
                                new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30,
                                    0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F,
                                    0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D,
                                    0x3D]);
                        } else {
                            let licenseRequestStr = byteToString(DrmRequest.data);
                            let licenseResponseStr = await getHttpData("http://license.dev.trustdta.com:8080/drmproxy/v3/getLicense?contentId=xuxinsw", licenseRequestStr);
                            responseArray = stringToUint8Array(licenseResponseStr);
                            responseArray2 = stringToUint8Array(licenseResponseStr);
                        }
                        keySession.processMediaKeyResponse(responseArray).then((keyId) => {
                            console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse success");
                            keySession.processMediaKeyResponse(responseArray2).then((keyId) => {
                                expect(sign).assertEqual(1);
                                keySession.off('keysChange');
                                keySession.destroy();
                                mediaKeySystem.destroy();
                                console.log("XX SESSION_ON_OFF_0700 keysChange success");
                                done();
                            }).catch((err:BusinessError) => {
                                console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                                keySession.destroy();
                                mediaKeySystem.destroy();
                                done();
                                expect(false).assertEqual(true);
                            });
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                            keySession.destroy();
                            mediaKeySystem.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) => {
                    console.log("XX SESSION_ON_OFF_0700 processMediaKeyResponse err end", err);
                    keySession.destroy();
                    mediaKeySystem.destroy();
                    done();
                    expect(false).assertEqual(true);
                });
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0800 failed");
                keySession!.destroy();
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                if(isClearPlay){
                    try {
                        mediaKeySystem = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX SESSION_ON_OFF_0900 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }
                    let sign = 1;
                    mediaKeySystem!.on('keySystemRequired', (eventInfo) => {
                        console.info('bbbbb receive keySystemRequired ' + eventInfo.info);
                        console.info('bbbbb receive keySystemRequired ' + eventInfo.extraInfo);
                        sign = 2;
                    });
                    mediaKeySystem!.generateKeySystemRequest().then((drmRequest) => {
                        console.log("XX SESSION_ON_OFF_0900 generateKeySystemRequest end", drmRequest.data, drmRequest.defaultURL);
                        console.log("XX SESSION_ON_OFF_0900 processKeySystemResponse start");
                        let arry =
                            new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A,
                                0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,
                                0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D,
                                0x3D]);
                        mediaKeySystem!.processKeySystemResponse(arry).then(() => {
                            expect(sign).assertEqual(2);
                            mediaKeySystem!.off('keySystemRequired');
                            mediaKeySystem!.destroy();
                            console.log("XX SESSION_ON_OFF_0900 keySystemRequired success");
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_0900 processKeySystemResponse err end", err);
                            mediaKeySystem!.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_0900 generateKeySystemRequest err end", err);
                        mediaKeySystem!.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX SESSION_ON_OFF_0900 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
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
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                if(isClearPlay){
                    try {
                        mediaKeySystem = drm.createMediaKeySystem(systemName);
                    } catch (err) {
                        console.log("XX SESSION_ON_OFF_1000 createMediaKeySystem failed");
                        done();
                        expect(false).assertEqual(true);
                    }
                    let sign = 1;
                    mediaKeySystem!.on('keySystemRequired', (eventInfo) => {
                        console.info('bbbbb receive keySystemRequired ' + eventInfo.info);
                        console.info('bbbbb receive keySystemRequired ' + eventInfo.extraInfo);
                        sign = 2;
                    });
                    mediaKeySystem!.off('keySystemRequired');
                    mediaKeySystem!.generateKeySystemRequest().then((drmRequest) => {
                        console.log("XX SESSION_ON_OFF_1000 generateKeySystemRequest end", drmRequest.data, drmRequest.defaultURL);
                        console.log("XX SESSION_ON_OFF_1000 processKeySystemResponse start");
                        let arry =
                            new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A,
                                0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48,
                                0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D,
                                0x3D]);
                        mediaKeySystem!.processKeySystemResponse(arry).then(() => {
                            expect(sign).assertEqual(1);
                            mediaKeySystem!.destroy();
                            console.log("XX SESSION_ON_OFF_1000 keySystemRequired success");
                            done();
                        }).catch((err:BusinessError) => {
                            console.log("XX SESSION_ON_OFF_1000 processKeySystemResponse err end", err);
                            mediaKeySystem.destroy();
                            done();
                            expect(false).assertEqual(true);
                        });
                    }).catch((err:BusinessError) => {
                        console.log("XX SESSION_ON_OFF_1000 generateKeySystemRequest err end", err);
                        mediaKeySystem.destroy();
                        done();
                        expect(false).assertEqual(true);
                    });
                } else {
                    done();
                }
            } catch (err) {
                console.log("XX SESSION_ON_OFF_1000 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2300
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 创建最大64个system
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2300', 0, async (done:Function) => {
            let drmMediaKeySystem:drm.MediaKeySystem[] = [];
            let errCode = 0;
            for (let i = 0; i < 64; i++) {
                drmMediaKeySystem[i] = drm.createMediaKeySystem(systemName);
                expect(drmMediaKeySystem[i].getStatistics()).not().assertUndefined();
            }
            try {
                let drmMediaKeySystem2 = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2300 createMediaKeySystem err end", err.code);
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
        * @tc.desc      : 创建最大64个session
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2400', 0, async (done:Function) => {
            let drmMediaKeySystem:drm.MediaKeySystem;
            try {
                drmMediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2400 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }
            let sessionArray:drm.MediaKeySession[] = [];
            let errCode = 0;
            for (let i = 0; i < 64; i++) {
                sessionArray[i] = drmMediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                expect(sessionArray[i].getContentProtectionLevel()).not().assertUndefined();
            }
            try {
                let session2 = drmMediaKeySystem!.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            } catch (err) {
                console.log("XX DRM_FRAMEWORK_API_2400 createMediaKeySession err end", err.code);
                errCode = err.code;
                for (let j = 0; j < 64; j++) {
                    sessionArray[j].destroy();
                }
                drmMediaKeySystem!.destroy();
            }
            expect(errCode).assertEqual(drm.DrmErrorCode.MAX_SESSION_NUM_REACHED);
            done();
        });
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1000
        * @tc.name      : testGetMetric
        * @tc.desc      : get metric information
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1000', 1, (done:Function) => {
            let mediaKeySystem:drm.MediaKeySystem;
            try {
                mediaKeySystem = drm.createMediaKeySystem(systemName);
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1000 createMediaKeySystem failed");
                done();
                expect(false).assertEqual(true);
            }

            try {
                let sessionArray:drm.MediaKeySession[] = [];
                let metric = mediaKeySystem!.getStatistics();
                for (let item of metric) {
                    console.log("XX TEST metric" + item.name + ':' + item.value);
                    if (item.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                        expect(item.value).assertEqual('0');
                    }
                }
                for (let i = 0; i < 64; i++) {
                    sessionArray[i] = mediaKeySystem!.createMediaKeySession();
                }
                let metric2 = mediaKeySystem!.getStatistics();
                for (let item2 of metric2) {
                    console.log("XX TEST metric2" + item2.name + ':' + item2.value);
                    if (item2.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                        expect(item2.value).assertEqual('64');
                    }
                }
                for (let j = 0; j < 32; j++) {
                    sessionArray[j].destroy();
                }
                let metric3 = mediaKeySystem!.getStatistics();
                for (let item3 of metric3) {
                    console.log("XX TEST metric3" + item3.name + ':' + item3.value);
                    if (item3.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                        expect(item3.value).assertEqual('32');
                    }
                }
                for (let k = 32; k < 64; k++) {
                    sessionArray[k].destroy();
                }
                mediaKeySystem!.destroy();
                done();
            } catch (err) {
                console.log("XX SET_GET_CONFIG_1000 failed");
                mediaKeySystem!.destroy();
                done();
                expect(false).assertEqual(true);
            }
        })
    })
}
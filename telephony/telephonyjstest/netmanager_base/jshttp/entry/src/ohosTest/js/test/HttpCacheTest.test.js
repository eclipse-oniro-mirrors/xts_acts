/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import net_http from '@ohos.net.http';
import connection from '@ohos.net.connection'
import { describe, expect, it , TestType, Size, Level } from '@ohos/hypium'

export default function HttpCacheTest() {
    describe('HttpCacheTest', function () {

   
       /*
        * @tc.number:SUB_Telephony_NetStack_HttpTestBasicGet_0100
        * @tc.name: testTelephonyNetStackHttpTestBasicGet0100
        * @tc.desc: usingCache test
        * @tc.level: Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it('testTelephonyNetStackHttpTestBasicGet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function(done){
            connection.hasDefaultNet(function (error, data) {
                console.log(JSON.stringify(error))
                console.log('data: ' + data)
                if (data) {
                    let http = net_http.createHttp();
                    http.request('https://httpbin.org/anything', {
                        usingCache: true
                    }).then(function (data) {
                        http.destroy();
                        expect(data.responseCode === net_http.ResponseCode.OK || data.responseCode > 500).assertTrue();
                        done();
                        return;
                    });
                }
            })
        });

       /*
        * @tc.number:SUB_Telephony_NetStack_HttpTestBasicGet_0200
        * @tc.name: testTelephonyNetStackHttpTestBasicGet0200
        * @tc.desc: usingCache test
        * @tc.level: Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it('testTelephonyNetStackHttpTestBasicGet0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestBasicGet_0200';
            connection.hasDefaultNet(function (error, data) {
                console.log(JSON.stringify(error))
                console.log('data: ' + data)
                if (data) {
                    let http = net_http.createHttp();
                    http.request('https://httpbin.org/anything', {
                        usingCache: false
                    }).then(function (data) {
                        http.destroy();
                        console.info(CaseName + JSON.stringify(data));
                        expect(data.responseCode === net_http.ResponseCode.OK || data.responseCode > 500).assertTrue();
                        done();
                        return;
                    });
                }
            })
        });

       /*
        * @tc.number:SUB_Telephony_NetStack_HttpTestCacheFlush_0100
        * @tc.name: testTelephonyNetStackHttpTestCacheFlush_0100
        * @tc.desc: cache flush test
        * @tc.level: Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it('testTelephonyNetStackHttpTestCacheFlush_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestCacheFlush_0100';
            connection.hasDefaultNet(function (error, data) {
                console.log(JSON.stringify(error))
                console.log('data: ' + data)
                if (data) {
                    let http = net_http.createHttp();
                    let cache = net_http.createHttpResponseCache(10 * 1024 * 1024);
                    http.request('https://httpbin.org/anything', {
                        usingCache: true
                    }).then(function () {
                        cache.flush().then(function (data) {
                            http.destroy();
                            console.info(CaseName + JSON.stringify(data));
                            expect(data === undefined).assertTrue();
                            done();
                            return;
                        });
                    });
                }
            })
        });

       /*
        * @tc.number:SUB_Telephony_NetStack_HttpTestCacheFlush_0200
        * @tc.name: testTelephonyNetStackHttpTestCacheFlush_0200
        * @tc.desc: cache flush test
        * @tc.level: Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it('testTelephonyNetStackHttpTestCacheFlush_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestCacheFlush_0200';
            connection.hasDefaultNet(function (error, data) {
                console.log(JSON.stringify(error))
                console.log('data: ' + data)
                if (data) {
                    let http = net_http.createHttp();
                    let cache = net_http.createHttpResponseCache(10 * 1024 * 1024);
                    http.request('https://httpbin.org/anything', {
                        usingCache: true
                    }).then(function () {
                        cache.flush(function (data) {
                            http.destroy();
                            console.info(CaseName + JSON.stringify(data));
                            expect(data === undefined).assertTrue();
                            done();
                            return;
                        });
                    });
                }
            })
        });

       /*
        * @tc.number:SUB_Telephony_NetStack_HttpTestCacheDelete_0100
        * @tc.name: testTelephonyNetStackHttpTestCacheDelete0100
        * @tc.desc: cache flush test
        * @tc.level: Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it('testTelephonyNetStackHttpTestCacheDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestCacheDelete_0100';
            connection.hasDefaultNet(function (error, data) {
                console.log(JSON.stringify(error))
                console.log('data: ' + data)
                if (data) {
                    let http = net_http.createHttp();
                    let cache = net_http.createHttpResponseCache(10 * 1024 * 1024);
                    http.request('https://httpbin.org/anything', {
                        usingCache: true
                    }).then(function () {
                        cache.delete().then(function (data) {
                            http.destroy();
                            console.info(CaseName + JSON.stringify(data));
                            expect(data === undefined).assertTrue();
                            done();
                            return;
                        });
                    });
                }
            })
        });

        /**
        * @tc.number    Telephony_NetStack_HttpTestCacheDelete_0200
        * @tc.name      use callback form test cache.delete
        * @tc.desc      cache flush test
        */

        it('Telephony_NetStack_HttpTestCacheDelete_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestCacheDelete_0200';
            connection.hasDefaultNet(function (error, data) {
                console.log(JSON.stringify(error))
                console.log('data: ' + data)
                if (data) {
                    let http = net_http.createHttp();
                    let cache = net_http.createHttpResponseCache(10 * 1024 * 1024);
                    http.request('https://httpbin.org/anything', {
                        usingCache: true
                    }).then(function () {
                        cache.delete(function (data) {
                            http.destroy();
                            console.info(CaseName + JSON.stringify(data));
                            expect(data === undefined).assertTrue();
                            done();
                            return;
                        });
                    });
                }
            })
        });
    });
};

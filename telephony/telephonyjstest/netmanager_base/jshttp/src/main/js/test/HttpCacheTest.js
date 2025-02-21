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
import { describe, expect, it } from '@ohos/hypium'

export default function HttpCacheTest() {
    describe('HttpCacheTest', function () {

        /**
        * @tc.number    Telephony_NetStack_HttpTestBasicGet_0100
        * @tc.name      set usingCache to true
        * @tc.desc      usingCache test
        */

        it('Telephony_NetStack_HttpTestBasicGet_0100', 0, async function(done){
            let http = net_http.createHttp();
            http.request('https://httpbin.org/anything', {
                usingCache : true
            }).then(function(data){
                http.destroy();
                expect(data.responseCode === net_http.ResponseCode.OK).assertTrue();
                done();
                return;
            });
        });

        /**
        * @tc.number    Telephony_NetStack_HttpTestBasicGet_0200
        * @tc.name      set usingCache to false
        * @tc.desc      usingCache test
        */

        it('Telephony_NetStack_HttpTestBasicGet_0200', 0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestBasicGet_0200';
            let http = net_http.createHttp();
            http.request('https://httpbin.org/anything', {
                usingCache : false
            }).then(function(data){
                http.destroy();
                console.info(CaseName + JSON.stringify(data));
                expect(data.responseCode === net_http.ResponseCode.OK).assertTrue();
                done();
                return;
            });
        });

        /**
        * @tc.number    Telephony_NetStack_HttpTestCacheFlush_0100
        * @tc.name      use callback form test cache.flush
        * @tc.desc      cache flush test
        */

        it('Telephony_NetStack_HttpTestCacheFlush_0100', 0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestCacheFlush_0100';
            let http = net_http.createHttp();
            let cache = net_http.createHttpResponseCache(10*1024*1024);
            http.request('https://httpbin.org/anything',{
                usingCache : true
            }).then(function (){
                cache.flush().then(function (data){
                    http.destroy();
                    console.info(CaseName + JSON.stringify(data));
                    expect(data === undefined).assertTrue();
                    done();
                    return;
                });
            });
        });

        /**
        * @tc.number    Telephony_NetStack_HttpTestCacheFlush_0200
        * @tc.name      use promise form test cache.flush
        * @tc.desc      cache flush test
        */

        it('Telephony_NetStack_HttpTestCacheFlush_0200', 0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestCacheFlush_0200';
            let http = net_http.createHttp();
            let cache = net_http.createHttpResponseCache(10*1024*1024);
            http.request('https://httpbin.org/anything',{
                usingCache : true
            }).then(function (){
                cache.flush(function (data){
                    http.destroy();
                    console.info(CaseName + JSON.stringify(data));
                    expect(data === undefined).assertTrue();
                    done();
                    return;
                });
            });
        });

        /**
        * @tc.number    Telephony_NetStack_HttpTestCacheDelete_0100
        * @tc.name      use callback form test cache.delete
        * @tc.desc      cache flush test
        */

        it('Telephony_NetStack_HttpTestCacheDelete_0100', 0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestCacheDelete_0100';
            let http = net_http.createHttp();
            let cache = net_http.createHttpResponseCache(10*1024*1024);
            http.request('https://httpbin.org/anything',{
                usingCache : true
            }).then(function (){
                cache.delete().then(function (data){
                    http.destroy();
                    console.info(CaseName + JSON.stringify(data));
                    expect(data === undefined).assertTrue();
                    done();
                    return;
                });
            });
        });

        /**
        * @tc.number    Telephony_NetStack_HttpTestCacheDelete_0200
        * @tc.name      use callback form test cache.delete
        * @tc.desc      cache flush test
        */

        it('Telephony_NetStack_HttpTestCacheDelete_0200', 0, async function(done){
            let CaseName = 'Telephony_NetStack_HttpTestCacheDelete_0200';
            let http = net_http.createHttp();
            let cache = net_http.createHttpResponseCache(10*1024*1024);
            http.request('https://httpbin.org/anything',{
                usingCache : true
            }).then(function (){
                cache.delete(function (data){
                    http.destroy();
                    console.info(CaseName + JSON.stringify(data));
                    expect(data === undefined).assertTrue();
                    done();
                    return;
                });
            });
        });
    });
};
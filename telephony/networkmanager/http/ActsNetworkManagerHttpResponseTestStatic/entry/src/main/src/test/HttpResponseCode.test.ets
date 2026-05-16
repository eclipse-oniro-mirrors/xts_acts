/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import http from '@ohos.net.http';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';

const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err) {
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err) {
        console.info("expectInfo", `test sucess`);
    }
}



export default function HttpResponseCodeTest() {

    describe("HttpResponseCodeTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0100
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0100
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.OK == 200)
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0200
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0200
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.CREATED == 201)
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0300
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0300
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.ACCEPTED == 202);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0400
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0400
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.NOT_AUTHORITATIVE == 203);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0500
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0500
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.NO_CONTENT == 204);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0600
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0600
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.RESET == 205);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0700
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0700
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.PARTIAL == 206);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0800
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0800
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.MULT_CHOICE == 300);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_0900
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_0900
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_0900';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.MOVED_PERM == 301);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1000
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1000
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.MOVED_TEMP == 302);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1100
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1100
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.SEE_OTHER == 303);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1200
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1200
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.NOT_MODIFIED == 304);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1300
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1300
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.USE_PROXY == 305);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1400
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1400
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.BAD_REQUEST == 400);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1500
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1500
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.UNAUTHORIZED == 401);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1600
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1600
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.PAYMENT_REQUIRED == 402);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1700
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1700
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.FORBIDDEN == 403);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1800
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1800
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.NOT_FOUND == 404);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_1900
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_1900
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_1900';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.BAD_METHOD == 405);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2000
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2000
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.NOT_ACCEPTABLE == 406);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2100
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2100
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.PROXY_AUTH == 407);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2200
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2200
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.CLIENT_TIMEOUT == 408);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2300
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2300
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.CONFLICT == 409);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2400
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2400
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.GONE == 410);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2500
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2500
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.LENGTH_REQUIRED == 411);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2600
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2600
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.PRECON_FAILED == 412);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2700
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2700
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.ENTITY_TOO_LARGE == 413);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2800
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2800
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.REQ_TOO_LONG == 414);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_2900
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_2900
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_2900';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.UNSUPPORTED_TYPE == 415);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3000
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3000
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.INTERNAL_ERROR == 500);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3100
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3100
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.NOT_IMPLEMENTED == 501);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3200
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3200
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.BAD_GATEWAY == 502);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3300
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3300
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.UNAVAILABLE == 503);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3400
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3400
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.GATEWAY_TIMEOUT == 504);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3500
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3500
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                ExpectTrue(http.ResponseCode.VERSION == 505);
                done();
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3600
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3600
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3700
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3700
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'request success: data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            httpRequest.destroy();
                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        });
                    }

                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3800
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3800
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(`${XTS_TEST_HTTP_URL}openHarmonyXts`, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                httpRequest.destroy();
                                ExpectFail();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'request success: data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 404);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.name   testNetworkMgrHttpResponseCode_static_3900
         * @tc.number SUB_NetworkMgr_Http_ResponseCode_3900
         * @tc.desc   Test ResponseCode property.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testNetworkMgrHttpResponseCode_static_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrHttpResponseCode_static_3900';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(`${XTS_TEST_HTTP_URL}openHarmonyXts`).then((data: http.HttpResponse) => {
                           hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 404);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            httpRequest.destroy();
                            ExpectFail();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })



    })

}
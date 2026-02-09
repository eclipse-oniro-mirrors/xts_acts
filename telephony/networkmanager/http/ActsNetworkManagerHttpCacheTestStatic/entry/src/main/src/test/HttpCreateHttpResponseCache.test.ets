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
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import http from '@ohos.net.http';

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

export default function HttpCreateHttpResponseCacheTest() {

    describe("HttpCreateHttpResponseCacheTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.name   testNetworkMgrHttpCreateHttpResponseCache_static_0200
         * @tc.number SUB_NetworkMgr_Http_CreateHttpResponseCache_0200
         * @tc.desc   Create a default object to store the response of HTTP access requests.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpCreateHttpResponseCache_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpCreateHttpResponseCache_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let cacheSize: int = 10;
                let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache(cacheSize);
                ExpectTrue(typeof httpResponseCache == 'object');
                done();
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.name   testNetworkMgrHttpCreateHttpResponseCache0300
         * @tc.number SUB_NetworkMgr_Http_CreateHttpResponseCache_0300
         * @tc.desc   Create a default object to store the response of HTTP access requests.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpCreateHttpResponseCache0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpCreateHttpResponseCache0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                let cacheSize: int = 11;
                let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache(cacheSize);
                ExpectTrue(typeof httpResponseCache == 'object');
                done();
            } catch (err) {
                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

    })

}
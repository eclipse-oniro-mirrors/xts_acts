/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, expect, it, Level, Size, TestType  } from '@ohos/hypium';
import http from '@ohos.net.http';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

export default function HttpCreateHttpResponseCacheTest() {
  describe('HttpCreateHttpResponseCacheTest', () => {
    /**
     * @tc.number : SUB_NetworkMgr_Http_CreateHttpResponseCache_0100
     * @tc.name   : testNetworkMgrHttpCreateHttpResponseCache0100
     * @tc.desc   : Create a default object to store the response of HTTP access requests.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpCreateHttpResponseCache0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpCreateHttpResponseCache0100';
      console.info(`${caseName}---Start`);
      try {
        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
        ExpectTrue(typeof httpResponseCache == 'object');
        done();
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_CreateHttpResponseCache_0200
     * @tc.name   : testNetworkMgrHttpCreateHttpResponseCache0200
     * @tc.desc   : Create a default object to store the response of HTTP access requests.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpCreateHttpResponseCache0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpCreateHttpResponseCache0200';
      console.info(`${caseName}---Start`);
      try {
        let cacheSize: number = 10;
        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache(cacheSize);
        ExpectTrue(typeof httpResponseCache == 'object');
        done();
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_CreateHttpResponseCache_0300
     * @tc.name   : testNetworkMgrHttpCreateHttpResponseCache0300
     * @tc.desc   : Create a default object to store the response of HTTP access requests.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrHttpCreateHttpResponseCache0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpCreateHttpResponseCache0300';
      console.info(`${caseName}---Start`);
      try {
        let cacheSize: number = 11;
        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache(cacheSize);
        ExpectTrue(typeof httpResponseCache == 'object');
        done();
      } catch (err) {
        console.info(`${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName}---End `);
    });
  });
}

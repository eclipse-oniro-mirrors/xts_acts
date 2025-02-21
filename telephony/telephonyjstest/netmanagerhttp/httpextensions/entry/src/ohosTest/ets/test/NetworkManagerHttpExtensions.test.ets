/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import net_http from '@ohos.net.http';
import type { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function NetworkManagerHttpExtensions() {
  describe('NetworkManagerHttpExtensions', () => {
    /**
     * @tc.number SUB_Telephony_netstack_Http_Extensions_Xts_0100
     * @tc.name http::request
     * @tc.desc Test on property
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_netstack_Http_Extensions_Xts_0100', 0, async (done:Function) => {
      let caseName = 'SUB_Telephony_netstack_Http_Extensions_Xts_0100';
      try {
        let httpRequest = net_http.createHttp();
        let resp = await httpRequest.request("https://www.baidu.com");
        console.info(`${caseName} createHttp success`);
        expect (resp.responseCode).assertEqual(200);
        done();
      } catch (error) {
        console.info(`${caseName} createHttp fail ${JSON.stringify(error)}`);
      }
    });

    /**
     * @tc.number SUB_Telephony_netstack_Http_Extensions_Xts_0200
     * @tc.name http::request
     * @tc.desc Test on property
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_netstack_Http_Extensions_Xts_0200', 0, async (done:Function) => {
      let caseName = 'SUB_Telephony_netstack_Http_Extensions_Xts_0200';
      let httpRequest = net_http.createHttp();
      try {
        let resp = await httpRequest.request("https://www.zhihu.com", {
          connectTimeout: 3000,
          dnsServers: ['11.1.11.1'],
        });
        console.info(`${caseName} createHttp success`);
        expect(resp.responseCode).assertEqual(200);
        done();
      } catch (e) {
        let err = e as BusinessError;
        console.error('DnsError: ' + JSON.stringify(e));
        expect(err.code).assertEqual(2300028);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_netstack_Http_Extensions_Xts_0300
     * @tc.name http::request
     * @tc.desc Test on property
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_netstack_Http_Extensions_Xts_0300', 0, async (done:Function) => {
      let caseName = 'SUB_Telephony_netstack_Http_Extensions_Xts_0300';
      try {
        let httpRequest = net_http.createHttp();
        let resp = await httpRequest.request("https://www.baidu.com", {
          dnsServers:['223.5.5.5'],
        });
        console.info(`${caseName} createHttp success`);
        expect(resp.responseCode).assertEqual(200);
        done();
      } catch (error) {
        console.info(`${caseName} createHttp fail ${JSON.stringify(error)}`);
      }
    });
  })
}
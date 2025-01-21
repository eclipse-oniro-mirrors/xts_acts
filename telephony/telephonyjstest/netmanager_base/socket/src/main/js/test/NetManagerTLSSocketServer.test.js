/**
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import netSocket from '@ohos.net.socket';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function NetManagerTlsSocketServerTest() {
    describe('NetManagerTLSSocketServerTest', function () {

        /**
         * @tc.number NetworkManager_TLSSocketServer_on_connect_0100
         * @tc.name Test on() interface
         * @tc.desc Function test
         */
        it('NetworkManager_TLSSocketServer_on_connect_0100', 0, async function (done) {
            let caseName = 'NetworkManager_TLSSocketServer_on_connect_0100';
            let tlsServer = netSocket.constructTLSSocketServerInstance();
            try {
                tlsServer.on('connect', data => {
                    console.info(`${caseName} on connect success ${JSON.stringify(data)}`);
                    expect(data.clientId != undefined).assertTrue();
                    done();
                });
                tlsServer.off('connect');
                done();
            } catch (error) {
                console.info(`${caseName} catch error, expect error: [${error.code}, ${error.message}]`);
                ExpectFalse();
                done();
                return;
            }
        });
    });
}
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

import { describe, it, expect } from '@ohos/hypium';
import http from '@ohos.net.http';

export default function NetworkManagerCaPathTest() {
    describe('NetworkManagerCaPathTest', function () {

        let URL1 = "https://www.openharmony.cn";

        let httpRequestOptions1 = {
            method: http.RequestMethod.GET,
            header: {
                'Content-Type': 'application/json'
            },
            caPath: "/data/storage/el2/base/files/OpenHarmonyCA.pem"
        }
        let httpRequestOptions2 = {
            method: http.RequestMethod.GET,
            header: {
                'Content-Type': 'application/json'
            },
            caPath: ""
        }
        let httpRequestOptions3 = {
            method: http.RequestMethod.GET,
            header: {
                'Content-Type': 'application/json'
            }
        }

        /**
         * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0100
         * @tc.name   request: input https://www.openharmony.cn/ & error of caPath by Async
         * @tc.desc   Function test
         */
        it("SUB_Telephony_NetStack_HTTPSCertificateManagement_0100", 0, function (done) {
            let CASE_NAME = 'SUB_Telephony_NetStack_HTTPSCertificateManagement_0100';
            let httpRequest = http.createHttp();
            httpRequest.request(URL1, httpRequestOptions1, (err, data) => {
                if (err) {
                    console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(err)}`);
                    expect(err.code == 2300077).assertTrue();
                    httpRequest.destroy();
                    done();
                } else {
                    console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
                    expect(false).assertTrue();
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0200
         * @tc.name   request: input https://www.openharmony.cn/ & null of caPath by Async
         * @tc.desc   Function test
         */
        it("SUB_Telephony_NetStack_HTTPSCertificateManagement_0200", 0, function (done) {
            let CASE_NAME = 'SUB_Telephony_NetStack_HTTPSCertificateManagement_0200';
            let httpRequest = http.createHttp();
            httpRequest.request(URL1, httpRequestOptions2, (err, data) => {
                if (err) {
                    console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(err)}`);
                    expect(err.code == 2300077).assertTrue();
                    httpRequest.destroy();
                    done();
                } else {
                    console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
                    expect(false).assertTrue();
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0300
         * @tc.name   request: input https://www.openharmony.cn/ & default of caPath by Async
         * @tc.desc   Function test
         */
        it("SUB_Telephony_NetStack_HTTPSCertificateManagement_0300", 0, function (done) {
            let CASE_NAME = 'SUB_Telephony_NetStack_HTTPSCertificateManagement_0300';
            let httpRequest = http.createHttp();
            httpRequest.request(URL1, httpRequestOptions3, (err, data) => {
                if (err) {
                    console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(err)}`);
                    expect(err.code == 2300077).assertTrue();
                    httpRequest.destroy();
                    done();
                } else {
                    console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
                    expect(false).assertTrue();
                    done();
                }
            });
        });
    });
}
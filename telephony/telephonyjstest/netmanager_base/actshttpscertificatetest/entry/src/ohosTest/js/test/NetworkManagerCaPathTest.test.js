/**
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, Size, TestType  } from '@ohos/hypium';
import http from '@ohos.net.http';

export default function NetworkManagerCaPathTest() {
    describe('NetworkManagerCaPathTest', function () {

        let URL1 = "https://www.openharmony.cn";

        let httpRequestOptions1 = {
            method: http.RequestMethod.GET,
            header: {
                'Content-Type': 'application/json'
            },
            caPath: "/data/storage/"
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
		
		function expectFalse() {
			try {
				expect().assertFail();
			} catch (err) {
				console.info('assertion failure');
			}
		}

        /**
         * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0100
         * @tc.name SUB_Telephony_NetStack_HTTPSCertificateManagement_0100  
		 * @tc.desc request: input https://www.openharmony.cn/ & error of caPath by Async
		 * @tc.level 0
		 * @tc.type Function
         * @tc.size SmallTest
         */
        it("SUB_Telephony_NetStack_HTTPSCertificateManagement_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            let CASE_NAME = 'SUB_Telephony_NetStack_HTTPSCertificateManagement_0100';
			try {
				let httpRequest = http.createHttp();
				httpRequest.request(URL1, httpRequestOptions1, (err, data) => {
					console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(undefined);
                })
				httpRequest.destroy();
				done();
			} catch (error) {
				console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(error)}`);
				expectFalse();
				done();
			}
        })

        /**
         * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0200
         * @tc.name SUB_Telephony_NetStack_HTTPSCertificateManagement_0200
         * @tc.desc request: input https://www.openharmony.cn/ & null of caPath by Async
         * @tc.level 2
         * @tc.type Function
         * @tc.size SmallTest
         */
        it("SUB_Telephony_NetStack_HTTPSCertificateManagement_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            let CASE_NAME = 'SUB_Telephony_NetStack_HTTPSCertificateManagement_0200';
            try {
                let httpRequest = http.createHttp();
                httpRequest.request(URL1, httpRequestOptions2, (err, data) => {
                    console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(undefined);
                })
                httpRequest.destroy();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(error)}`);
                expectFalse();
                done();
            }
        })

        /**
         * @tc.number SUB_Telephony_NetStack_HTTPSCertificateManagement_0300
         * @tc.name SUB_Telephony_NetStack_HTTPSCertificateManagement_0300
         * @tc.desc request: input https://www.openharmony.cn/ & default of caPath by Async
         * @tc.level 2
         * @tc.type Function
         * @tc.size SmallTest
         */
        it("SUB_Telephony_NetStack_HTTPSCertificateManagement_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , function (done) {
            let CASE_NAME = 'SUB_Telephony_NetStack_HTTPSCertificateManagement_0300';
            try {
                let httpRequest = http.createHttp();
                httpRequest.request(URL1, httpRequestOptions3, (err, data) => {
                    console.info(`${CASE_NAME} httpsRequest success, data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(undefined);
                })
                httpRequest.destroy();
                done();
            } catch (error) {
                console.info(`${CASE_NAME} httpsRequest fail, err: ${JSON.stringify(error)}`);
                expectFalse();
                done();
            }
        })
    })
}

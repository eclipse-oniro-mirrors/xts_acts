/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import sensor from '@system.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SystemServiceExceptionTest() {
describe("SystemServiceExceptionTest", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

    let invild = -1;

    /*
     * @tc.number:SUB_SensorsSystem_ServiceException_JSTest_0010
     * @tc.name:newTestServiceException_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     */
    it("newTestServiceException_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------newTestServiceException_SensorJsTest001---------------------------');
		try {
            sensor.on(invild, (data) => {
                console.info('newTestServiceException_SensorJsTest001 data: ' + JSON.stringify(data))
            });
        } catch(err) {
            console.info("newTestServiceException_SensorJsTest001 exception: " + JSON.stringify(err))
            console.info('newTestServiceException_SensorJsTest001 code: ' + err.code)
            console.info('newTestServiceException_SensorJsTest001 message: ' + err.message)
			done()
        }
    })

})}

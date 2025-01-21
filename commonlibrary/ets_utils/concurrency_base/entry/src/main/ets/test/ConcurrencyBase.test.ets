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
import app from '@system.app'
import worker from "@ohos.worker"
import taskpool from '@ohos.taskpool';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

@Concurrent
function taskDateFunction(input: Date): Date {
    return input;
}


export default function ConcurrencyBaseTest() {
    let printLog = 'ConcurrencyBaseTest:';
    describe('ConcurrencyBaseTest', () => {

        afterAll(() => {
            console.info(printLog + 'total case over');
        })

        /**
         * @tc.name: SendableDataSimple0
         * @tc.desc: checks Sendable with primitive type
         * @tc.author: maksim-khramov
         */
        it('SendableDateSimple0', 0, async (done: Function) => {
          let input: Date = new Date();

          let task = new taskpool.Task(taskDateFunction, input);
          await taskpool
            .execute(task)
            .then((result: Object) => {
              let resultString = (result as Date).toString();
              let inputString = input.toString();
              let resultBool = resultString === inputString
              console.log(printLog + " result='" + resultString + "', input='" + inputString + "', result==input = " + resultBool)
              expect(resultString).assertEqual(inputString);
              done();
            });
        })
    })
}

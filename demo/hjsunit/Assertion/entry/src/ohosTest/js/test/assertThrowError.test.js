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
import {describe, it, expect, expect, Level, Size, TestType } from 'deccjsunit/index'

describe('assertThrowError', function () {
    /**
     * @tc.name   assertThrowErrorFail001
     * @tc.number assertThrowErrorFail001
     * @tc.desc   assertThrowErrorFail001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('assertThrowErrorFail001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let a = 12;
        expect(a).assertThrowError()
    })
    /**
     * @tc.name   assertThrowErrorSuccess
     * @tc.number assertThrowErrorSuccess
     * @tc.desc   assertThrowErrorSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('assertThrowErrorSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let a = test
        function test() {
            throw Error("exception")
        }
        expect(a).assertThrowError("exception");
    })
    /**
     * @tc.name   assertThrowErrorFail002
     * @tc.number assertThrowErrorFail002
     * @tc.desc   assertThrowErrorFail002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('assertThrowErrorFail002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let a = test
        function test() {
            throw Error("exception")
        }
        expect(a).assertThrowError("test");
    })
})
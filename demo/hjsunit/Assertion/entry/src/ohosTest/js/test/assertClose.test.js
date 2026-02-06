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
import {describe, it, expect, Level, Size, TestType } from 'deccjsunit/index'

describe('assertClose', function () {
    /**
     * @tc.name   assertCloseSuccess001
     * @tc.number assertCloseSuccess001
     * @tc.desc   assertCloseSuccess001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('assertCloseSuccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let a = 100;
        let b = 0.1
        expect(a).assertClose(99, b)
    })
    /**
     * @tc.name   assertCloseFail002
     * @tc.number assertCloseFail002
     * @tc.desc   assertCloseFail002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('assertCloseFail002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let a = 100;
        let b = 0.1
        expect(a).assertClose(1, b)
    })
    /**
     * @tc.name   assertCloseFail003
     * @tc.number assertCloseFail003
     * @tc.desc   assertCloseFail003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('assertCloseFail003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        let a = 100;
        let b = 0.1
        expect(a).assertClose(null, b)
    })
    /**
     * @tc.name   assertCloseFail004
     * @tc.number assertCloseFail004
     * @tc.desc   assertCloseFail004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('assertCloseFail004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
        expect(null).assertClose(null, 0)
    })
})
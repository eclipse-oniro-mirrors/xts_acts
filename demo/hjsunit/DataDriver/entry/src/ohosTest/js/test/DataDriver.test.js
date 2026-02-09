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
import {describe, it, expect, Level, Size, TestType} from 'deccjsunit/index'

describe('testSuite01', function () {
    /**
     * @tc.name   testSpec01
     * @tc.number testSpec01
     * @tc.desc   testSpec01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpec01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (data) {
        console.info('testSpec01......' + JSON.stringify(data))
    })
    /**
     * @tc.name   testSpec02
     * @tc.number testSpec02
     * @tc.desc   testSpec02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSpec02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (data) {
        console.info('testSpec02......' + JSON.stringify(data))
    })
})
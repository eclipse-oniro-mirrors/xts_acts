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
import {describe, it, Level, Size, TestType } from 'deccjsunit/index'

describe('callback', function () {
    /**
     * @tc.name   callbackDemo
     * @tc.number callbackDemo
     * @tc.desc   callbackDemo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('callbackDemo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        await a()
    })
})

function a(done){
    setTimeout(function(){
        console.log("run a after 1000ms")
    },1000)
    done()
}
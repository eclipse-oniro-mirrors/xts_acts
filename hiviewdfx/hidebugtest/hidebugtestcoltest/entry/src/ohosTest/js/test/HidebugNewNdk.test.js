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
import hidebug from '@ohos.hidebug';
import hilog from '@ohos.hilog';
import testNapi from "libhidebugndk.so";
import {describe, it, expect, TestType, Level, Size} from '@ohos/hypium';


export default function HidebugNewNdkTest() {
describe('HidebugNewNdkTest', function () {

    /**
     * @tc.number SUB_DFX_DFR_Hidebug_StackBack_Fun_0100
     * @tc.name SUB_DFX_DFR_Hidebug_StackBack_Fun_0100
     * @tc.desc 验证获取HiDebug开放调用栈回溯20新增接口
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFR_Hidebug_StackBack_Fun_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            testNapi.getBacktraceFromFp();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFR_Hidebug_StackBack_Fun_0100 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })
})
}

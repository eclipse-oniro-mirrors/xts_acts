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
     * @tc.level Level2
     */
    it('SUB_DFX_DFR_Hidebug_StackBack_Fun_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            testNapi.getBacktraceFromFp();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFR_Hidebug_StackBack_Fun_0100 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFR_Hidebug_StackBack_NDK_0800
     * @tc.name SUB_DFX_DFR_Hidebug_StackBack_NDK_0800
     * @tc.desc OH_HiDebug_SymbolicAddress接口 返回11400200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('SUB_DFX_DFR_Hidebug_StackBack_NDK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            testNapi.getBacktraceInvaildFromFp();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFR_Hidebug_StackBack_NDK_0800 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_C_0700
     * @tc.name SUB_DFX_DFT_HiDebug_Mem_C_0700
     * @tc.desc 内定泄漏定制能力开放-支持calloc等内存分配
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFT_HiDebug_Mem_C_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            let  errorcode = testNapi.getDefaultMallocDispatchTable()
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0700 > errorcode =: ${errorcode}`);
            expect(errorcode == 0).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_Mem_C_0700 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_C_1300
     * @tc.name SUB_DFX_DFT_HiDebug_Mem_C_1300
     * @tc.desc 内定泄漏定制能力开放-结束hook操作
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFT_HiDebug_Mem_C_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            let  errorcode = testNapi.restoreMallocDispatchTable()
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_1300 > errorcode =: ${errorcode}`);
            expect(errorcode == 0).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_Mem_C_1300 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_C_1400
     * @tc.name SUB_DFX_DFT_HiDebug_Mem_C_1400
     * @tc.desc 内定泄漏定制能力开放-内存分配参数无效
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('SUB_DFX_DFT_HiDebug_Mem_C_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            let  errorcode = testNapi.getInvaildMallocDispatchTable()
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_1400 > errorcode =: ${errorcode}`);
            expect(errorcode == 401).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_Mem_C_1400 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })
})
}

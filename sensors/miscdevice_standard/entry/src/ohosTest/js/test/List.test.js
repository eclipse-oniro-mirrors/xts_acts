/*
 * Copyright (C) 2021-2025 Huawei Device Co., Ltd.
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
import VibratorJsTest_misc_1 from './Vibrator_old.test'
import VibratorJsTest_misc_2 from './Vibrator_new_common.test'
import VibratorJsTest_misc_3 from './Vibrator_newSupplement_common.test'
import VibratorJsTest_misc_6 from './Vibrator_newSupportTest.test'
import VibratorJsTest_misc_7 from './Vibrator_options.test'
import VibratorJsTest_misc_8 from './Vibrator_newEffect.test'
import VibratorJsTest_misc_9 from './VibratorPatternJsunit.test'
import VibratorJsTest_misc_10 from './VibratorPatternJsunit1.test'
import VibratorJsTest_misc_11 from './VibratorPatternJsunit2.test'
import VibratorJsTest_misc_12 from './VibratorPatternJsunit3.test'
import VibratorTest from './VibratorErrCode1.test.js'
export default function testsuite() {
    VibratorJsTest_misc_1()
    VibratorJsTest_misc_2()
    VibratorJsTest_misc_3()
    VibratorJsTest_misc_6()
    VibratorJsTest_misc_7()
    VibratorJsTest_misc_8()
    VibratorJsTest_misc_9()
    VibratorJsTest_misc_10()
    VibratorJsTest_misc_11()
    VibratorJsTest_misc_12()
    VibratorTest()
}

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
import VibratorJsTest_misc_1 from './Vibrator_old.test.js'
import VibratorJsTest_misc_2 from './Vibrator_new_common.test.js'
import VibratorJsTest_misc_3 from './Vibrator_newSupplement_common.test.js'
import VibratorJsTest_misc_6 from './Vibrator_newSupportTest.test.js'
import VibratorJsTest_misc_7 from './Vibrator_options.test.js'
export default function testsuite() {
    VibratorJsTest_misc_1()
    VibratorJsTest_misc_2()
	VibratorJsTest_misc_3()
	VibratorJsTest_misc_6()
	VibratorJsTest_misc_7()
}

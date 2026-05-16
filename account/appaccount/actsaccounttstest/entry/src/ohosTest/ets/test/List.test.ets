/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
import ActsAppAccountOptionalParameterTest from './ActsAppAccountOptionalParameterTest.test.ets'
import AppAccountAuthenticatorStage2Stage from './AppAccountAuthenticatorStage2Stage.test.ets'
import AppAccountErrCodeCheck from './AppAccountErrCodeCheck.test.ets'
import AppAccountParamLengthCheck from './AppAccountParamLengthCheck.test';
import AppAccountParamCheck from './AppAccountParamCheck.test';
import AppAccountParamCheck1 from './AppAccountParamCheck1.test';
import AppAccountParamCheck2 from './AppAccountParamCheck2.test';
import AppAccountParamCheck3 from './AppAccountParamCheck3.test';
import AppAccountParamCheck4 from './AppAccountParamCheck4.test';
import AppAccountParamCheck5 from './AppAccountParamCheck5.test';

export default function testsuite() {
	ActsAppAccountOptionalParameterTest()
	AppAccountAuthenticatorStage2Stage()
	AppAccountErrCodeCheck()
	AppAccountParamLengthCheck();
	AppAccountParamCheck();
	AppAccountParamCheck1();
	AppAccountParamCheck2();
	AppAccountParamCheck3();
	AppAccountParamCheck4();
	AppAccountParamCheck5();
}
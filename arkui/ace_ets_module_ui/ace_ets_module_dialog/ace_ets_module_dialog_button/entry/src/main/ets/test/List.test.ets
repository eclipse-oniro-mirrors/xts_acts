/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import buttonControlTest from "./buttonTest/buttonControl.test"
import buttonTest from './buttonTest/button'
import buttonJsunit from './buttonTest/ButtonJsunit.test';
import buttonEnabledJsunit from './buttonTest/buttonEnabledJsunit.test';
import button3Jsunit from './buttonTest/Button3Jsunit.test';
import ButtonHoverTest from './buttonTest/ButtonHover.test';
import ActsgetcomponentTest from './buttonTest/getcomponent.test';
import buttonMaxFontSize from './button/buttonMaxFontSize.test';
import ButtonTypeTest from './buttonType/ButtonTypeTest.test';
import buttonType from './buttonType/buttonTypeApi.test';
import buttonMinFontScaleTest from './buttonType/minFontScale.test'
import buttonMaxFontScaleTest from './buttonType/maxFontScale.test'
import ButtonJsunit2 from './buttonTest/ButtonJsunit2.test';
import ButtonApi1 from './button/ButtonApi1.test';
import ButtonApi2 from './button/ButtonApi2.test';
import ButtonTextTest from './buttonTest/ButtonText.test';

export default function testsuite() {
  buttonControlTest();
  buttonTest();
  buttonJsunit();
  buttonEnabledJsunit();
  button3Jsunit();
  ButtonHoverTest();
  ActsgetcomponentTest();
  buttonMaxFontSize();
  ButtonTypeTest()
  buttonType()
  buttonMinFontScaleTest()
  buttonMaxFontScaleTest()
  ButtonJsunit2()
  ButtonApi1();
  ButtonApi2();
  ButtonTextTest();
}
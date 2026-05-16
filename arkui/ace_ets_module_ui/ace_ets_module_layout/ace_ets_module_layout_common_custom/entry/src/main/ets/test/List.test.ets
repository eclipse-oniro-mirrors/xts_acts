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

import Calc01 from './CommonCustom/Calc01Jsunit.test';
import Calc02 from './CommonCustom/Calc02Jsunit.test';
import ChainWeight from './CommonCustom/ChainWeight.test'
import CustomLayoutUniqueidTest from './CommonCustom/CustomLayoutUniqueidTest.test'
import ButtonAlignTest from './CommonCustom/ButtonAlignTest.ets'
import mediaQueryOffJsunit from './CommonCustom/mediaQuery.test.ets';
import backgroundAndSizeSettingJsunit from './CommonAttrs/BackgroundAndSizeSettingJsunit.test';
import borderJsunit from './CommonAttrs/BorderJsunit.test';
import BorderRadiusRenderStrategyTest from './CommonAttrs/BorderRadiusRenderStrategyTest.ets';
import FlexFourBoundaryTest from './CommonAttrs/FlexFourBoundaryTest.ets';
import LayoutFourReturnTest from './CommonCustom/LayoutFourReturnTest.ets';

export default function testsuite() {
  Calc01();
  Calc02();
  ChainWeight();
  CustomLayoutUniqueidTest();
  ButtonAlignTest();
  mediaQueryOffJsunit();
  backgroundAndSizeSettingJsunit();
  borderJsunit();
  BorderRadiusRenderStrategyTest();
  FlexFourBoundaryTest();
  LayoutFourReturnTest();
}
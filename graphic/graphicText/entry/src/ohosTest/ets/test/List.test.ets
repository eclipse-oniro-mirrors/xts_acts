/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import graphicTextATest from './graphicTextA.test'
import graphicTextBTest from './graphicTextB.test'
import graphicTextCTest from './graphicTextC.test'
import graphicTextClass from './graphicTextClass.test'
import graphicTextEnum from './graphicTextEnum.test'
import graphicTextHadTest from './graphicTextHad.test'
import graphicTextInterface from './graphicTextInterface.test'
import graphicFontDescriptorTest from './graphicFontDescriptor.test'
import LineMetricsTest from './LineMetricsTest.test'
import LineMetricsTwoTest from './LineMetricsTwoTest.test'
import FontDescriptorTest from './FontDescriptorTest.test'
import FontDescriptorTest1 from './FontDescriptorTest1.test'
import graphicTextNewAPI from './GraphicTextNewAPI.test'
import GraphicTextAPI21Test from './GraphicTextAPI21Test.test'
import GraphicTextAPI22 from './GraphicTextAPI22.test'
import GraphicTextAPI23 from './GraphicTextAPI23.test'
import graphicTextA1Test from './GraphicTextA1.test'

export default function testsuite() {
  graphicTextATest();
  graphicTextBTest();
  graphicTextCTest();
  graphicTextClass();
  graphicTextEnum();
  graphicTextHadTest();
  graphicTextInterface();
  graphicFontDescriptorTest();
  LineMetricsTest();
  LineMetricsTwoTest();
  FontDescriptorTest();
  FontDescriptorTest1();
  graphicTextNewAPI();
  GraphicTextAPI21Test();
  GraphicTextAPI22();
  GraphicTextAPI23();
  graphicTextA1Test();
}
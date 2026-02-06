/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import MutableBuilder001 from './mutableBuilderTest/MutableBuilder001.test';
import BuilderParam001 from './BuilderParam/BuilderParam001.test';
import Builder0080TestJsunit from './builder/Builder0080TestJsunit.test';
import Builder0070TestJsunit from './builder/Builder0070TestJsunit.test';
import Builder0050TestJsunit from './builder/Builder0050TestJsunit.test';
import Builder0120TestJsunit from './builder/Builder0120TestJsunit.test';
import Extend0010TestJsunit from './Extend/Extend0010TestJsunit.test';
import Local1Jsunit from './ComponentV2Test/Local1Jsunit.test';
import Local2Jsunit from './ComponentV2Test/Local2Jsunit.test';
import Param1Jsunit from './ComponentV2Test/Param1Jsunit.test';
import Param2Jsunit from './ComponentV2Test/Param2Jsunit.test';
import Param3Jsunit from './ComponentV2Test/Param3Jsunit.test';
import Param4Jsunit from './ComponentV2Test/Param4Jsunit.test';
import Monitor1Jsunit from './ComponentV2Test/Monitor1Jsunit.test';
import Monitor2Jsunit from './ComponentV2Test/Monitor2Jsunit.test';
import Monitor3Jsunit from './ComponentV2Test/Monitor3Jsunit.test';
import Monitor4Jsunit from './ComponentV2Test/Monitor4Jsunit.test';
import LocalTestJsunit from './ComponentV2Test/LocalTestJsunit.test';
import ComponentV2TestJsunit from './ComponentV2Test/ComponentV2TestJsunit.test';
import ParamTestJsunit from './ComponentV2Test/ParamTestJsunit.test';
import ParamTestJsunit1 from './ComponentV2Test/ParamTestJsunit1.test';
import LifeCycle0120TestJsunit from './lifecycle/LifeCycle0120TestJsunit.test';
import LifeCycle0050TestJsunit from './lifecycle/LifeCycle0050TestJsunit.test';
import LocalBuilder0040TestJsunit from './local_builder/LocalBuilder0040TestJsunit.test';
import WrapBuilder0010TestJsunit from './wrap_builder/WrapBuilder0010TestJsunit.test';
import WrapBuilder0020Test from './wrap_builder/WrapBuilder0020Test.test';
import EntryParamsTest from './entryTest/EntryParamsTest.test';
import Styles0010TestJsunit from './styles/Styles0010TestJsunit.test';
import LifeCycleTest0510 from './lifecycle/LifeCycleTest0510.test';
import LifeCycleTest0100 from './lifecycle/LifeCycleTest0100.test';
import LifeCycleTest0300 from './lifecycle/LifeCycleTest0300.test';
import LifeCycleTest0310 from './lifecycle/LifeCycleTest0310.test';


export default function testsuite() {
    MutableBuilder001();
    BuilderParam001();
    Builder0080TestJsunit();
    Builder0120TestJsunit();
    Builder0050TestJsunit();
    Builder0070TestJsunit();
    Extend0010TestJsunit();
    Local1Jsunit();
    Local2Jsunit();
    Param1Jsunit();
    Param2Jsunit();
    Param3Jsunit();
    Param4Jsunit();
    Monitor1Jsunit();
    Monitor2Jsunit();
    Monitor3Jsunit();
    Monitor4Jsunit();
    LocalTestJsunit();
    ComponentV2TestJsunit();
    ParamTestJsunit();
    ParamTestJsunit1();
    LifeCycle0050TestJsunit();
    LifeCycle0120TestJsunit();
    LocalBuilder0040TestJsunit();
    WrapBuilder0010TestJsunit();
    WrapBuilder0020Test();
    EntryParamsTest();
    Styles0010TestJsunit();
    LifeCycleTest0510();
    LifeCycleTest0100();
    LifeCycleTest0300();
    LifeCycleTest0310();
}

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

import stepperUIJsunit from './stepperTest/stepperUIJsunit.test';
import stepperItemDisabledJsunit from './stepperTest/stepperItem.test';
import stepperLayout001 from './stepperTest/stepperLayout/stepperLayout001.test';
import stepperLayout002 from './stepperTest/stepperLayout/stepperLayout002.test';
import stepperLayout003 from './stepperTest/stepperLayout/stepperLayout003.test';
import stepperLayout004 from './stepperTest/stepperLayout/stepperLayout004.test';
import stepperInterface001 from './stepperTest/stepperInterface/stepperInterface001.test';
import stepperInterface002 from './stepperTest/stepperInterface/stepperInterface002.test';
import stepperInterface003 from './stepperTest/stepperInterface/stepperInterface003.test';
import stepperInterface004 from './stepperTest/stepperInterface/stepperInterface004.test';
import stepperInterface005 from './stepperTest/stepperInterface/stepperInterface005.test';
import stepperInterface006 from './stepperTest/stepperInterface/stepperInterface006.test';
import stepperInterface009 from './stepperTest/stepperInterface/stepperInterface009.test';
import stepperAction001 from './stepperTest/stepperAction/stepperAction001.test';
import stepperAction027 from './stepperTest/stepperAction/stepperAction027.test';
import stepperJsunit1 from './stepperTest/StepperJsunit1.test'
import StepperTest1 from './stepperTest/StepperTest1.test'
import StepperJsunit11 from './stepperTest/StepperJsunit11.test';
import stepperItemJsunit from './stepperTest/stepperItemJsunit.test';

export default function testsuite() {
  stepperLayout001();
  stepperLayout002();
  stepperLayout003();
  stepperLayout004();
  stepperInterface001();
  stepperInterface002();
  stepperInterface003();
  stepperInterface004();
  stepperInterface005();
  stepperInterface006();
  stepperInterface009();
  stepperAction001();
  stepperAction027();
  StepperJsunit11();
  stepperUIJsunit();
  stepperJsunit1();
  stepperItemDisabledJsunit();
  StepperTest1();
  stepperItemJsunit();
}
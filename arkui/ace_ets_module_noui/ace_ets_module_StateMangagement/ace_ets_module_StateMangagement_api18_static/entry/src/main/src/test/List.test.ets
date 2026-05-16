'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import ArrayLikeStringTest from './ArrayLikeTest/ArrayLikeStringTest.test';
import RepeatCloseReuseTest0110 from './repeat/RepeatCloseReuseTest0110.test';
import RepeatLazyTest0150 from './repeat/RepeatLazyTest0150.test';
import repeatReusableFalse from './ReusableTest/repeatReusableFalse.test';
import repeatReusableTrue from './ReusableTest/repeatReusableTrue.test';
import ReuseV2Test0030 from './ReuseV2Test/ReuseV2Test0030.test';
import AddMonitorErrorCode from './AddMonitorTest/AddMonitorErrorCode.test';
import AddMonitorNoPath from './AddMonitorTest/AddMonitorNoPath.test';
import AddMonitorSetPath from './AddMonitorTest/AddMonitorSetPath.test';
import AddMonitorObservedV2Int from './AddMonitorTest/AddMonitorObservedV2Int.test';
import AddMonitorObservedV2Boolean from './AddMonitorTest/AddMonitorObservedV2Boolean.test';
import AddMonitorObservedV2String from './AddMonitorTest/AddMonitorObservedV2String.test';
import AddMonitorObservedV2Array from './AddMonitorTest/AddMonitorObservedV2Array.test';
import AddMonitorObservedV2Date from './AddMonitorTest/AddMonitorObservedV2Date.test';
import AddMonitorObservedV2Map from './AddMonitorTest/AddMonitorObservedV2Map.test';
import AddMonitorObservedV2Set from './AddMonitorTest/AddMonitorObservedV2Set.test';
import AddMonitorParentChild from './AddMonitorTest/AddMonitorParentChild.test';
import AddMonitorTwoDimensionalArray from './AddMonitorTest/AddMonitorTwoDimensionalArray.test';

export default function testsuite() {
  ArrayLikeStringTest(); 
  RepeatCloseReuseTest0110(); 
  RepeatLazyTest0150();  
  repeatReusableFalse(); 
  repeatReusableTrue(); 
  ReuseV2Test0030(); 
  AddMonitorNoPath(); 
  AddMonitorSetPath(); 
  AddMonitorObservedV2Int(); 
  AddMonitorObservedV2Boolean(); 
  AddMonitorObservedV2String(); 
  AddMonitorObservedV2Array(); 
  AddMonitorObservedV2Date(); 
  AddMonitorObservedV2Map(); 
  AddMonitorObservedV2Set(); 
  AddMonitorErrorCode();
  AddMonitorParentChild(); 
  AddMonitorTwoDimensionalArray(); 
}
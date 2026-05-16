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
import RelativeContainer_Level from './RelativeContainer/RelativeContainer_Level/RelativeContainer_Level.test.ets';
import RelativeContainer_Vertical
  from './RelativeContainer/RelativeContainer_Vertical/RelativeContainer_Vertical.test.ets';
import RelativeContainer_AnchorPoint_Absent
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Absent.test.ets';
import RelativeContainer_AnchorPoint_Circular_Dependency
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Circular_Dependency.test.ets';
import RelativeContainer_AnchorPoint_Interdependence
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Interdependence.test.ets';
import RelativeContainer_AnchorPoint_Margin
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Margin.test.ets';
import RelativeContainer_AnchorPoint_Padding
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Padding.test.ets';
import RelativeContainer_AnchorPoint_ThreeDirection
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_ThreeDirection.test.ets';
import RelativeContainer_AnchorPoint_TwoDirection
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_TwoDirection.test.ets';
import RelativeContainer_AnchorPoint_Visibility_Hidden
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Visibility_Hidden.test.ets';
import RelativeContainer_AnchorPoint_Visibility_None
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Visibility_None.test.ets';
import RelativeContainer_AnchorPoint_NoId
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_NoId.test.ets';
import RelativeContainer_AnchorPoint_Id_Null
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Id_Null.test.ets';
import RelativeContainer_AnchorPoint_Id_Undefined
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Id_Undefined.test.ets';
import RelativeContainer_AnchorPoint_Offset
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Offset.test.ets';
import RelativeContainer_AnchorPoint_Position
  from './RelativeContainer/RelativeContainer_AnchorPoint/RelativeContainer_AnchorPoint_Position.test.ets';
import RelativeContainerApi from './RelativeContainer/RelativeContainerApi.test'
import RelativeContainerLocalizedDirectionStartTest from './RelativeContainer/RelativeContainerLocalizedDirectionStartTest.test'
import RelativeContainerStartApi from './RelativeContainer/RelativeContainerStartApi.test'

import RelativeGuideLine from './RelativeContainerTest/RelativeGuideLine.test'
import RelativeGuideLine2 from './RelativeContainerTest/RelativeGuideLine2.test'
import RelativeGuideLine3 from './RelativeContainerTest/RelativeGuideLine3.test'
import RelativeGuideLine4 from './RelativeContainerTest/RelativeGuideLine4.test'
import RelativeGuideLine5 from './RelativeContainerTest/RelativeGuideLine5.test'
import RelativeGuideLine6 from './RelativeContainerTest/RelativeGuideLine6.test'
import RelativeGuideLine7 from './RelativeContainerTest/RelativeGuideLine7.test'
import RelativeChain from './RelativeContainerTest/RelativeChain.test'
import RelativeChain2 from './RelativeContainerTest/RelativeChain2.test'
import RelativeChain3 from './RelativeContainerTest/RelativeChain3.test'
import RelativeChain4 from './RelativeContainerTest/RelativeChain4.test'
import RelativeChain5 from './RelativeContainerTest/RelativeChain5.test'
import RelativeChain6 from './RelativeContainerTest/RelativeChain6.test'
import RelativeChain7 from './RelativeContainerTest/RelativeChain7.test'
import RelativeChain8 from './RelativeContainerTest/RelativeChain8.test'
import RelativeChain9 from './RelativeContainerTest/RelativeChain9.test'
import RelativeChain10 from './RelativeContainerTest/RelativeChain10.test'
import RelativeChain11 from './RelativeContainerTest/RelativeChain11.test'
import RelativeChain12 from './RelativeContainerTest/RelativeChain12.test'
import RelativeBarrier from './RelativeContainerTest/RelativeBarrier.test'
import RelativeBarrier2 from './RelativeContainerTest/RelativeBarrier2.test'
import RelativeBarrier3 from './RelativeContainerTest/RelativeBarrier3.test'
import RelativeBarrier4 from './RelativeContainerTest/RelativeBarrier4.test'
import RelativeBarrier5 from './RelativeContainerTest/RelativeBarrier5.test'
import RelativeBarrier6 from './RelativeContainerTest/RelativeBarrier6.test'
import RelativeBarrier7 from './RelativeContainerTest/RelativeBarrier7.test'
import RelativeBarrier8 from './RelativeContainerTest/RelativeBarrier8.test'
import RelativeBorder from './RelativeContainerTest/RelativeBorder.test'
import RelativePadding from './RelativeContainerTest/RelativePadding.test'
import RelativeContainer from './RelativeContainerTest/RelativeContainer.test'
import relativeCTest from "./RelativeContainerTest/relative/relative.test"

export default function testsuite() {
  RelativeContainer_Level()
  RelativeContainer_Vertical()
  RelativeContainer_AnchorPoint_Absent()
  RelativeContainer_AnchorPoint_Circular_Dependency()
  RelativeContainer_AnchorPoint_Interdependence()
  RelativeContainer_AnchorPoint_Margin()
  RelativeContainer_AnchorPoint_Padding()
  RelativeContainer_AnchorPoint_ThreeDirection()
  RelativeContainer_AnchorPoint_TwoDirection()
  RelativeContainer_AnchorPoint_Visibility_Hidden()
  RelativeContainer_AnchorPoint_Visibility_None()
  RelativeContainer_AnchorPoint_NoId()
  RelativeContainer_AnchorPoint_Id_Null()
  RelativeContainer_AnchorPoint_Id_Undefined()
  RelativeContainer_AnchorPoint_Offset()
  RelativeContainer_AnchorPoint_Position()
  RelativeContainerApi();
  RelativeContainerLocalizedDirectionStartTest();
  RelativeContainerStartApi();

  RelativeGuideLine()
  RelativeGuideLine2()
  RelativeGuideLine3()
  RelativeGuideLine4()
  RelativeGuideLine5()
  RelativeGuideLine6()
  RelativeGuideLine7()
  RelativeChain()
  RelativeChain2()
  RelativeChain3()
  RelativeChain4()
  RelativeChain5()
  RelativeChain6()
  RelativeChain7()
  RelativeChain8()
  RelativeChain9()
  RelativeChain10()
  RelativeChain11()
  RelativeChain12()
  RelativeBarrier()
  RelativeBarrier2()
  RelativeBarrier3()
  RelativeBarrier4()
  RelativeBarrier5()
  RelativeBarrier6()
  RelativeBarrier7()
  RelativeBarrier8()
  RelativePadding()
  RelativeBorder()
  RelativeContainer()
  relativeCTest()
}
/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import PostOnIdleTest from "./onIdle/PostOnIdleTest.test"
import EmbeddedComponentOptionTest from "./EmbeddedComponentOption/EmbeddedComponentOptionTest.test"
import CustomComponentOnDrawFrontTest from "./customcomponent/CustomComponentOnDrawFrontTest.test"
import CustomComponentOnDrawBehindTest from "./customcomponent/CustomComponentOnDrawBehindTest.test"
import uiStatesTest from './uiState/UiStatesTest.test'
import OntouchTestDoneTest from "./touchTestDone/OntouchTestDoneTest.test"
import NodeUniqueIdTest from "./nodeUtils/NodeUniqueIdTest.test"
import uiInputErrorCodeTest from './uiInput/UiInputErrorCodeTest.test'
import SetForceDarkConfigTest from "./darkConfig/TestSetForceDarkConfig.test"
import TestInitModuleForArkTSEnv from "./arkTSEnv/TestInitModuleForArkTSEnv.test"
import RunTaskInScopeTest from "./scope/RunTaskInScopeTest.test"
import ListTypeNodeTest from './list/ListTypeNodeTest.test'
import ListCNodeTest from './list/ListCNodeTest.test'
import GridTypeNodeTest from './grid/GridTypeNodeTest.test'
import GridCNodeTest from './grid/GridCNodeTest.test'
import SwiperTypeNodeTest from './swiper/SwiperTypeNodeTest.test'
import SwiperCNodeTest from './swiper/SwiperCNodeTest.test'
import WaterFlowTypeNodeTest from './waterFlow/WaterFlowTypeNodeTest.test'
import WaterFlowCNodeTest from './waterFlow/WaterFlowCNodeTest.test'
import BindControllerTest from './BindController/BindController.test'
import RowTypeNodeTest from './row/RowTypeNodeTest.test'
import RowCNodeTest from './row/RowCNodeTest.test'
import ColumnTypeNodeTest from './Column/ColumnTypeNodeTest.test'
import ColumnCNodeTest from './Column/ColumnCNodeTest.test'
import FlexTypeNodeTest from './Flex/FlexTypeNodeTest.test'
import FlexCNodeTest from './Flex/FlexCNodeTest.test'
import StackTypeNodeTest from './Stack/StackTypeNodeTest.test'
import StackCNodeTest from './Stack/StackCNodeTest.test'
import RelativeContainerTypeNodeTest from './RelativeContainer/RelativeContainerTypeNodeTest.test'
import RelativeContainerCNodeTest from './RelativeContainer/RelativeContainerCNodeTest.test'

export default function testsuite() {
  PostOnIdleTest();
  EmbeddedComponentOptionTest();
  CustomComponentOnDrawFrontTest();
  CustomComponentOnDrawBehindTest();
  uiStatesTest();
  OntouchTestDoneTest();
  NodeUniqueIdTest();
  uiInputErrorCodeTest();
  SetForceDarkConfigTest();
  TestInitModuleForArkTSEnv();
  RunTaskInScopeTest();
  ListTypeNodeTest();
  ListCNodeTest();
  GridTypeNodeTest();
  GridCNodeTest();
  SwiperTypeNodeTest();
  SwiperCNodeTest();
  WaterFlowTypeNodeTest();
  WaterFlowCNodeTest();
  BindControllerTest();
  RowTypeNodeTest();
  RowCNodeTest();
  ColumnTypeNodeTest();
  ColumnCNodeTest();
  FlexTypeNodeTest();
  FlexCNodeTest();
  StackTypeNodeTest();
  StackCNodeTest();
  RelativeContainerTypeNodeTest();
  RelativeContainerCNodeTest();
}
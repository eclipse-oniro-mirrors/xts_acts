'use static';
/**
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
import ColumnSpaceResourceTest from './Column/ColumnSpaceResourceTest.test';
import FlexSpaceResourceTest from './Flex/FlexSpaceResourceTest.test';
import RowSpaceResourceTest from './Row/RowSpaceResourceTest.test';
import CustomLayoutUniqueidTest from './CustomLayout/CustomLayoutUniqueidTest.test';
import RowSpaceResourceTest from './Row/RowSpaceResourceTest.test';
import LayoutPolicyFixAtIdealSizeTest from './LayoutPolicy/LayoutPolicyFixAtIdealSize.test';
import LayoutPolicyWrapContentTest from './LayoutPolicy/LayoutPolicyWrapContent.test';
import RenderNodeAttributeTest from './RenderNodeAttribute/RenderNodeAttribute.test';
import RenderNodeTransformAttributeTest from './RenderNodeAttribute/RenderNodeTransformAttribute.test';
import RenderNodeShadowAttributeTest from './RenderNodeAttribute/RenderNodeShadowAttribute.test';
import RenderNodeBorderAttributeTest from './RenderNodeAttribute/RenderNodeBorderAttribute.test';
import RenderNodeOtherAttributeTest from './RenderNodeAttribute/RenderNodeOtherAttribute.test';
import TypeNodeGetColumn from './TypeNode/TypeNodeGetColumn.test';
import TypeNodeGetFlexAttribute from './TypeNode/TypeNodeGetFlexAttribute.test';
import TypeNodeGetImageAttribute from './TypeNode/TypeNodeGetImageAttribute.test';
import TypeNodeGetLoadingProgressAttribute from './TypeNode/TypeNodeGetLoadingProgressAttribute.test';
import TypeNodeGetRelativeContainerAttribute from './TypeNode/TypeNodeGetRelativeContainerAttribute.test';
import TypeNodeGetRowAttribute from './TypeNode/TypeNodeGetRowAttribute.test';
import TypeNodeGetStackAttribute from './TypeNode/TypeNodeGetStackAttribute.test';
import TypeNodeGetProgressAttribute from './TypeNode/TypeNodeGetProgressAttribute.test';
import TypeNodeGetButtonAttribute from './TypeNode/TypeNodeGetButtonAttribute.test';
import TypeNodeGetCheckboxAttribute from './TypeNode/TypeNodeGetCheckboxAttribute.test';
import TypeNodeGetRadioAttribute from './TypeNode/TypeNodeGetRadioAttribute.test';
import TypeNodeGetSliderAttribute from './TypeNode/TypeNodeGetSliderAttribute.test';
import TypeNodeGetToggleAttribute from './TypeNode/TypeNodeGetToggleAttribute.test';
import StackSyncLoadStaticTest from './Stack/StackSyncLoadStaticTest.test';

export default function testsuite() {
  ColumnSpaceResourceTest();
  FlexSpaceResourceTest();
  RowSpaceResourceTest();
  CustomLayoutUniqueidTest();
  LayoutPolicyFixAtIdealSizeTest();
  LayoutPolicyWrapContentTest();
  CustomLayoutUniqueidTest();
  RenderNodeAttributeTest();
  RenderNodeTransformAttributeTest();
  RenderNodeShadowAttributeTest();
  RenderNodeBorderAttributeTest();
  RenderNodeOtherAttributeTest();
  TypeNodeGetColumn();
  TypeNodeGetFlexAttribute();
  TypeNodeGetImageAttribute();
  TypeNodeGetLoadingProgressAttribute();
  TypeNodeGetRelativeContainerAttribute();
  TypeNodeGetRowAttribute();
  TypeNodeGetStackAttribute();
  TypeNodeGetProgressAttribute();
  TypeNodeGetButtonAttribute();
  TypeNodeGetCheckboxAttribute();
  TypeNodeGetRadioAttribute();
  TypeNodeGetSliderAttribute();
  TypeNodeGetToggleAttribute();
  StackSyncLoadStaticTest();
}

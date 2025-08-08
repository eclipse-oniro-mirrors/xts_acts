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
import overLayJsunit from './overlayTest/OverlayJsunit.test';
import zIndexJsunit from './zIndexTest/ZIndexJsunit.test';
import visibilityJsunit from './visibilityTest/VisibilityJsunit.test';
import AttributeModifierDemoAPI01 from './attributeModifierTest/AttributeModifierDemoAPI01Jsunit.test';
import AttributeModifierDemoAPI03 from './attributeModifierTest/AttributeModifierDemoAPI03Jsunit.test';
import accessVNTest from './AccessibleTest/accessVNTest.test';
import dymaticTest from "./attributeModifierTest/dymatic.test";
import outlineTest from './outlineTest/outlineTest.test';
import noBarrierComponentsTest from './noBarrierComponents.test';
import noBarriersGroupTest from './noBarriersGroup.test';
import HoverJsunit5 from './HoverTest/HoverJsunit5.test.ets';
import HoverJsunit11 from './HoverTest/HoverJsunit11.test.ets';
import HoverJsunit17 from './HoverTest/HoverJsunit17.test.ets';
import HoverJsunit23 from './HoverTest/HoverJsunit23.test.ets';
import HoverJsunit25 from './HoverTest/HoverJsunit25.test.ets';
import OverlayUIJsunit from './overlayTest/OverlayUIJsunit.test.ets';

export default function testsuite() {
  noBarrierComponentsTest();
  noBarriersGroupTest();
  overLayJsunit();
  zIndexJsunit();
  visibilityJsunit();
  AttributeModifierDemoAPI01();
  AttributeModifierDemoAPI03();
  accessVNTest();
  dymaticTest();
  outlineTest();
  HoverJsunit5();
  HoverJsunit11();
  HoverJsunit17();
  HoverJsunit23();
  HoverJsunit25();
  OverlayUIJsunit();
}
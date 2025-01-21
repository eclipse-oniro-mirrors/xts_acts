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
import frameNodeTest from './frameNodeTest/frameNodeTest.test';
import frameNodeTest1 from './frameNodeTest/frameNodeTest1.test';
import nodeContainerTest from './frameNodeTest/nodeContainerTest.test';
import APIsetOnclickTest from './frameNodeTest/APIsetOnclickTest.test';
import APIsetOnTouchTest from './frameNodeTest/APIsetOnTouchTest.test';
import frameNodeGetInterfaceTest from './frameNodeTest/frameNodeTestGetInterface.test';
import APIsetOnFocusTest from './frameNodeTest/APIsetOnFocusTest.test';
import APIsetOnHoverTest from './frameNodeTest/APIsetOnHoverTest.test';
import nodeList from './frameNodeTest/nodeList.test';
import nodeListItemGroup from './frameNodeTest/nodeListItemGroup.test';
import nodeWaterFlow from './frameNodeTest/nodeWaterFlow.test';

export default function testsuite() {
  APIsetOnclickTest();
  APIsetOnTouchTest();
  frameNodeTest()
  frameNodeTest1()
  nodeContainerTest()
  frameNodeGetInterfaceTest()
  APIsetOnFocusTest()
  APIsetOnHoverTest()
  nodeList()
  nodeListItemGroup()
  nodeWaterFlow()
}
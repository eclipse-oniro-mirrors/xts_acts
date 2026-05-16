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


import SideBarContainer_AttributeTest from './SideBarContainerTest/SideBarContainer_attribute/SideBarContainer_Attribute.test'
import SideBarContainerDivider from './SideBarContainerTest/SideBarContainerDivider/SideBarContainerDivider.test'
import SideBarContainerTypeTest from './SideBarContainerTest/SideBarContainerType/SideBarContainerType.test'
import SideBarContainerType_DefaultValue1 from './SideBarContainerTest/SideBarContainerType/SideBarContainerType_DefaultValue1.test'
import SideBarContainerType_DefaultValue2 from './SideBarContainerTest/SideBarContainerType/SideBarContainerType_DefaultValue2.test'
import SideBarContainerType_DefaultValue3 from './SideBarContainerTest/SideBarContainerType/SideBarContainerType_DefaultValue3.test'
import sidebar from './SideBarContainerTest/SideBar.test'
import sidebarIconsJsunit from './SideBarContainerTest/sidebarfirst.test'

export default function testsuite() {

  SideBarContainer_AttributeTest()
  SideBarContainerDivider() 
  SideBarContainerTypeTest()
  SideBarContainerType_DefaultValue1()
  SideBarContainerType_DefaultValue2()
  SideBarContainerType_DefaultValue3()
  sidebar()
  sidebarIconsJsunit()
}
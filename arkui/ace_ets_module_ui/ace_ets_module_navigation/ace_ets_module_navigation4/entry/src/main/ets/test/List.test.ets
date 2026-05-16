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
import RouterPageSizeChange from './UIobserver/Router/RouterPageSizeChange.test';
import QueryNavDestinationSize from './UIobserver/Navigation/QueryNavDestinationSize.test';
import NavDestinationSizeUnique from './UIobserver/Navigation/NavDestinationSizeUnique.test';
import GetStackSize from './Router/GetStackSize.test';
import NavigationDivider from './Navigation/NavigationDivider.test';
import NavPathStackGet from './Navigation/NavPathStackGet.test';
import NavPathStackParam from './Navigation/NavPathStackParam.test';
import NavPathStackPop from './Navigation/NavPathStackPop.test';
import NavPathStackRemove from './Navigation/NavPathStackRemove.test';
import NavPathStackReplaceDestination from './Navigation/NavPathStackReplaceDestination.test';
import NavPathStackReplacePath from './Navigation/NavPathStackReplacePath.test';
import NavigationAttributeNullUndefinedTest from './Navigation/NavigationAttributeNullUndefined.test';
import NavigationModeRatio from './Navigation/NavigationModeRatio.test';
import NavigatorAttributeNullUndefinedTest from './navigator/NavigatorAttributeNullUndefined.test';
import NavDestinationAttributeNullUndefinedTest from './navDestination/NavDestinationAttributeNullUndefined.test';
import TabsControllerNullUndefined from './TabsNullUndefined/TabsControllerNullUndefined.test';
import TabsAttributeNullUndefined from './TabsNullUndefined/TabsAttributeNullUndefined.test';
import AlphabetIndexerPropertiesNullUndefined from './AlphabetIndexNullUndefined/AlphabetIndexerPropertiesNullUndefined.test';

import routerApiNullUndefinedTest from './Router/routerApiNullUndefinedTest.test'
import ParticleApiNullUndefinedTest from './Router/ParticleApiNullUndefinedTest.test'
import IndicatorComponentNullUndefinedTest from './Router/IndicatorComponentNullUndefinedTest.test'
import SideBarContainerControlButtonNullUndefinedTest from './Router/SideBarContainerControlButtonNullUndefinedTest.test'
import StepperItemApiNullUndefinedTest from './Router/StepperItemApiNullUndefinedTest.test'

export default function testsuite() {
  GetStackSize()
  RouterPageSizeChange()
  QueryNavDestinationSize()
  NavPathStackGet()
  NavPathStackParam()
  NavPathStackPop()
  NavPathStackRemove()
  NavPathStackReplaceDestination()
  NavPathStackReplacePath()
  NavDestinationSizeUnique()
  NavigationDivider()
  NavigationAttributeNullUndefinedTest()
  NavigationModeRatio()
  NavigatorAttributeNullUndefinedTest()
  NavDestinationAttributeNullUndefinedTest()
  TabsControllerNullUndefined()
  TabsAttributeNullUndefined()
  AlphabetIndexerPropertiesNullUndefined()

  routerApiNullUndefinedTest()
  ParticleApiNullUndefinedTest()
  IndicatorComponentNullUndefinedTest()
  SideBarContainerControlButtonNullUndefinedTest()
  StepperItemApiNullUndefinedTest()
}
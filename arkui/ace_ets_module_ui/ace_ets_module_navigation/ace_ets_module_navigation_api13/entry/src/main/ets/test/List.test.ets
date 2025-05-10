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

import NavigationTitleTextModifier from './Navigation/NavigationTitleTextModifier.test'
import NavigationCustomTitlePage from './Navigation/NavigationCustomTitlePage.test'
import TitleOptionsToolOptions from './Navigation/TitleOptionsToolOptions.test'
import BarStylePage from './Navigation/BarStylePage.test'
import HideToolBarNavPage from './Navigation/HideToolBarNavPage.test'
import EntryOptionPage2 from './Navigation/EntryOptionPage2.test'
import EntryOptionPage from './Navigation/EntryOptionPage.test'
import NavDestinationUIObserver from './Navigation/NavDestinationUIObserver.test'

export default function testsuite() {
  NavigationTitleTextModifier();
  NavigationCustomTitlePage();
  TitleOptionsToolOptions();
  BarStylePage();
  HideToolBarNavPage();
  EntryOptionPage();
  EntryOptionPage2();
  NavDestinationUIObserver();
}